import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordrope/services/theme_service.dart';
import '../models/word.dart';
import '../models/category.dart' as model;
import '../models/game_state.dart';
import '../data/word_repository.dart';
import 'audio_service.dart';

class GameService extends ChangeNotifier {
  final SharedPreferences _prefs;
  final ThemeService settingsService;

  int _totalScore = 0;
  int _highScore = 0;
  int _lastRoundScore = 0;

  GameState? _gameState;
  model.Category? _currentCategory;
  String _currentLanguage = 'pt';
  final Random _random = Random();
  final AudioService _audioService = AudioService();
  List<Word> _availableWords = [];

  GameService(this._prefs, this.settingsService) {
    _loadScore();
  }

  int get totalScore => _totalScore;
  int get highScore => _highScore;
  int get lastRoundScore => _lastRoundScore;

  GameState? get gameState => _gameState;
  model.Category? get currentCategory => _currentCategory;

  Future<void> _loadScore() async {
    _totalScore = _prefs.getInt('totalScore') ?? 0;
    _highScore = _prefs.getInt('highScore') ?? 0;
    notifyListeners();
  }

  Future<void> _saveScore() async {
    await _prefs.setInt('totalScore', _totalScore);
    await _prefs.setInt('highScore', _highScore);
  }

  void setLanguage(String language) {
    if (WordRepository.isLanguageSupported(language)) {
      _currentLanguage = language;
      notifyListeners();
    }
  }

  List<model.Category> getAvailableCategories() {
    return WordRepository.getCategories(language: _currentLanguage);
  }

  bool get canUseHint {
    final gs = _gameState;

    if (gs == null || gs.status != GameStatus.playing) {
      return false;
    }
    if (gs.hintsUsed >= 3) {
      return false;
    }
    if (gs.remainingGuesses <= 1) {
      return false;
    }

    final hiddenLetters = gs.currentWord.uniqueLetters
        .where((letter) => !gs.guessedLetters.contains(letter));
    return hiddenLetters.isNotEmpty;
  }

  void useHint() {
    if (!canUseHint) return;

    final hiddenLetters = _gameState!.currentWord.uniqueLetters
        .where((letter) => !_gameState!.guessedLetters.contains(letter))
        .toList();
    hiddenLetters.shuffle();
    final letterToReveal = hiddenLetters.first;

    _gameState = _gameState!.copyWith(
      guessedLetters: {..._gameState!.guessedLetters, letterToReveal},
      wrongLetters: {
        ..._gameState!.wrongLetters,
        'HINT_${DateTime.now().millisecondsSinceEpoch}'
      },
      hintsUsed: _gameState!.hintsUsed + 1,
    );

    _audioService.playCorrectSound(soundEnabled: settingsService.soundEnabled);
    notifyListeners();
    _checkGameEnd();
  }

  void resetGame() {
    _gameState = null;
    notifyListeners();
  }

  void startNewGame(model.Category category) {
    if (_currentCategory?.id != category.id || _availableWords.isEmpty) {
      _currentCategory = category;
      _availableWords = WordRepository.getWordsFromCategory(
        category.id,
        language: _currentLanguage,
      );
      _availableWords.shuffle();
    }

    if (_availableWords.isEmpty) return;

    final randomWord = _availableWords.removeLast();

    String categoryNameForDisplay;

    if (category.id == 'random') {
      final originalCategory = WordRepository.getCategory(randomWord.category,
          language: _currentLanguage);
      categoryNameForDisplay = originalCategory?.name ?? 'Aleatório';
    } else {
      categoryNameForDisplay = category.name;
    }

    _gameState = GameState(
      currentWord: randomWord,
      displayCategoryName: categoryNameForDisplay,
      guessedLetters: {' '},
    );
    notifyListeners();
  }

  bool guessLetter(String letter) {
    if (_gameState == null || _gameState!.status != GameStatus.playing)
      return false;

    final upperLetter = letter.toUpperCase();
    final oldWrongCount = _gameState!.wrongGuessCount;

    if (_gameState!.wrongLetters.contains(upperLetter) ||
        _gameState!.guessedLetters.contains(upperLetter)) {
      return false;
    }

    final lettersToCheck = _accentMap[upperLetter] ?? [upperLetter];
    Set<String> correctLettersFound = {};

    for (var char in lettersToCheck) {
      if (_gameState!.currentWord.containsLetter(char)) {
        correctLettersFound.add(char);
      }
    }

    if (correctLettersFound.isNotEmpty) {
      _gameState = _gameState!.copyWith(
        guessedLetters: {
          ..._gameState!.guessedLetters,
          upperLetter,
          ...correctLettersFound
        },
      );
      _audioService.playCorrectSound(
          soundEnabled: settingsService.soundEnabled);
    } else {
      _gameState = _gameState!.copyWith(
        wrongLetters: {..._gameState!.wrongLetters, upperLetter},
      );
      _audioService.playWrongSound(soundEnabled: settingsService.soundEnabled);
    }

    notifyListeners();
    _checkGameEnd();
    return _gameState!.wrongGuessCount > oldWrongCount;
  }

  static const Map<String, List<String>> _accentMap = {
    'A': ['A', 'Á', 'À', 'Â', 'Ã'],
    'E': ['E', 'É', 'Ê'],
    'I': ['I', 'Í'],
    'O': ['O', 'Ó', 'Ô', 'Õ'],
    'U': ['U', 'Ú'],
    'C': ['C', 'Ç'],
  };

  void _checkGameEnd() {
    if (_gameState != null && _gameState!.status != GameStatus.playing) {
      bool gameWon = _gameState!.status == GameStatus.won;
      if (gameWon) {
        int basePoints = 50;
        int wordLengthBonus = _gameState!.currentWord.text.length * 5;
        int remainingGuessesBonus = _gameState!.remainingGuesses * 10;
        _lastRoundScore = basePoints + wordLengthBonus + remainingGuessesBonus;
        _totalScore += _lastRoundScore;
        if (_lastRoundScore > _highScore) {
          _highScore = _lastRoundScore;
        }
        _saveScore();
      } else {
        _lastRoundScore = 0;
      }

      Future.delayed(const Duration(milliseconds: 500), () {
        if (!ChangeNotifier.debugAssertNotDisposed(this)) return;
        if (gameWon) {
          _audioService.playVictorySound(
              soundEnabled: settingsService.soundEnabled);
        } else {
          _audioService.playDefeatSound(
              soundEnabled: settingsService.soundEnabled);
        }
        notifyListeners();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
