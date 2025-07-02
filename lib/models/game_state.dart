import 'package:flutter/foundation.dart';
import 'package:wordrope/models/word.dart';

enum GameStatus { playing, won, lost }

@immutable
class GameState {
  final Word currentWord;
  final Set<String> guessedLetters;
  final Set<String> wrongLetters;
  final int hintsUsed;
  // ADICIONADO: Campo para o nome da categoria a ser exibido
  final String displayCategoryName;

  const GameState({
    required this.currentWord,
    required this.displayCategoryName, // ADICIONADO: Parâmetro no construtor
    this.guessedLetters = const {},
    this.wrongLetters = const {},
    this.hintsUsed = 0,
  });

  int get wrongGuessCount =>
      wrongLetters.where((l) => !l.startsWith('HINT_')).length;
  int get hintPenalty =>
      wrongLetters.where((l) => l.startsWith('HINT_')).length;
  int get totalMistakes => wrongGuessCount + hintPenalty;

  int get remainingGuesses => 8 - totalMistakes;

  GameStatus get status {
    if (isWordComplete) {
      return GameStatus.won;
    }
    if (remainingGuesses <= 0) {
      return GameStatus.lost;
    }
    return GameStatus.playing;
  }

  bool get isWordComplete {
    for (final letter in currentWord.uniqueLetters) {
      if (letter != ' ' && !guessedLetters.contains(letter)) {
        return false;
      }
    }
    return true;
  }

  String get displayWord {
    return currentWord.text.split('').map((letter) {
      if (letter == ' ' || guessedLetters.contains(letter)) {
        return letter;
      }
      return '_';
    }).join(' ');
  }

  GameState copyWith({
    Word? currentWord,
    Set<String>? guessedLetters,
    Set<String>? wrongLetters,
    int? hintsUsed,
    String? displayCategoryName, // ADICIONADO: Parâmetro no copyWith
  }) {
    return GameState(
      currentWord: currentWord ?? this.currentWord,
      guessedLetters: guessedLetters ?? this.guessedLetters,
      wrongLetters: wrongLetters ?? this.wrongLetters,
      hintsUsed: hintsUsed ?? this.hintsUsed,
      displayCategoryName: displayCategoryName ?? this.displayCategoryName,
    );
  }
}
