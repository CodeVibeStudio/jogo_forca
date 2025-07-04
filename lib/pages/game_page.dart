import '../services/purchase_service.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../services/ad_service.dart';
import '../models/category.dart' as model;
import '../models/game_state.dart';
import '../services/game_service.dart';
import '../services/theme_service.dart';
import '../widgets/hangman_drawing.dart';
import '../widgets/word_display.dart';
import '../widgets/virtual_keyboard.dart';
import '../widgets/game_result_dialog.dart';

class GamePage extends StatefulWidget {
  final model.Category category;
  const GamePage({super.key, required this.category});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with TickerProviderStateMixin {
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;
  late AnimationController _shakeController;
  late AnimationController _hintIconAnimationController;
  late Animation<double> _hintIconAnimation;
  Timer? _inactivityTimer;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _setupHintAnimation();
    _startNewGame();
    //-- NOVO: A lógica de carregar o anúncio agora verifica se o usuário já é premium
    if (!kIsWeb) {
      final gameService = Provider.of<GameService>(context, listen: false);
      if (!gameService.isPremium) {
        _loadBannerAd();
      }
    }
  }

  @override
  void dispose() {
    _shakeController.dispose();
    _bannerAd?.dispose();
    _hintIconAnimationController.dispose();
    _inactivityTimer?.cancel();
    super.dispose();
  }

  void _setupHintAnimation() {
    _hintIconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _hintIconAnimation = Tween<double>(begin: 1.0, end: 1.25).animate(
      CurvedAnimation(
          parent: _hintIconAnimationController, curve: Curves.elasticOut),
    );
  }

  void _showHintPrompt() {
    final gameService = Provider.of<GameService>(context, listen: false);
    if (gameService.canUseHint && mounted) {
      _hintIconAnimationController.forward(from: 0.0);
    }
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 15), _showHintPrompt);
  }

  void _loadBannerAd() {
    _bannerAd = AdService.createBannerAd()
      ..load().then((_) {
        if (mounted) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        }
      });
  }

  void _setupAnimations() {
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _startNewGame() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final gameService = Provider.of<GameService>(context, listen: false);
        gameService.startNewGame(widget.category);
        _startInactivityTimer();
      }
    });
  }

  void _onLetterPressed(String letter) {
    final gameService = Provider.of<GameService>(context, listen: false);
    final wasWrong = gameService.guessLetter(letter);
    if (wasWrong) {
      _shakeController.forward(from: 0.0);
    }
    _startInactivityTimer();
    _checkGameEnd();
  }

  Future<void> _checkGameEnd() async {
    final gameService = Provider.of<GameService>(context, listen: false);
    final gameState = gameService.gameState;

    if (gameState?.status != GameStatus.playing) {
      _inactivityTimer?.cancel();
      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;

      final result = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (context) => GameResultDialog(
          onPlayAgain: () => Navigator.of(context).pop('play_again'),
          onBackToHome: () => Navigator.of(context).pop('back_to_home'),
        ),
      );

      if (result == 'play_again') {
        if (mounted) {
          gameService.resetGame();
          await Future.delayed(const Duration(milliseconds: 50));
          _startNewGame();
        }
      } else if (result == 'back_to_home') {
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //-- NOVO: Obtém o GameService aqui para usar em múltiplos lugares
    final gameService = context.watch<GameService>();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      //-- NOVO: Condição para mostrar o banner foi atualizada
      bottomNavigationBar: _isBannerAdLoaded && !gameService.isPremium
          ? SizedBox(
              height: _bannerAd!.size.height.toDouble(),
              width: _bannerAd!.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            )
          : const SizedBox.shrink(),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              //-- NOVO: Removido o Consumer daqui pois já obtemos o gameService acima
              child: Builder(
                builder: (context) {
                  final gameState = gameService.gameState;
                  if (gameState == null) {
                    return Center(
                        child: CircularProgressIndicator(
                            color: theme.colorScheme.primary));
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AnimatedBuilder(
                              animation: _shakeController,
                              builder: (context, child) => Transform.translate(
                                offset: Offset(
                                    sin(_shakeController.value * pi * 5) * 10,
                                    0),
                                child: child,
                              ),
                              child: HangmanDrawing(
                                  wrongGuesses: gameState.totalMistakes),
                            ),
                            Positioned(
                              bottom: 20,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                decoration: BoxDecoration(
                                  color:
                                      theme.colorScheme.surface.withAlpha(204),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  gameState.displayCategoryName,
                                  style: theme.textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
                        child: Column(
                          children: [
                            WordDisplay(
                                displayWord: gameState.displayWord,
                                isComplete: gameState.isWordComplete),
                            const SizedBox(height: 16),
                            VirtualKeyboard(
                              onLetterPressed: _onLetterPressed,
                              guessedLetters: gameState.guessedLetters,
                              wrongLetters: gameState.wrongLetters,
                              isGameActive:
                                  gameState.status == GameStatus.playing,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          Consumer<GameService>(
            builder: (context, gameService, child) {
              final gameState = gameService.gameState;
              if (gameState == null) return const SizedBox.shrink();
              return Text(
                'Tentativas: ${gameState.remainingGuesses}',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              );
            },
          ),
          Consumer<ThemeService>(
            builder: (context, settingsService, child) {
              final gameService = context.watch<GameService>();
              final gameState = gameService.gameState;
              final hintsLeft = gameState != null ? 3 - gameState.hintsUsed : 3;
              final isDarkMode = settingsService.themeMode == ThemeMode.dark;

              return Row(
                children: [
                  //-- CÓDIGO CORRIGIDO PARA O BOTÃO PREMIUM --
                  if (!gameService.isPremium)
                    IconButton(
                      icon: const Icon(Icons.workspace_premium_outlined),
                      tooltip: 'Remover Anúncios',
                      onPressed: () {
                        // Chama o serviço de compras para iniciar o fluxo de pagamento.
                        context.read<PurchaseService>().buyPremium();
                      },
                    ),
                  // O restante dos botões agora está no lugar certo
                  IconButton(
                    icon: Icon(
                      isDarkMode
                          ? Icons.wb_sunny_outlined
                          : Icons.nightlight_round_outlined,
                    ),
                    onPressed: () => settingsService.toggleTheme(),
                  ),
                  IconButton(
                    icon: Icon(
                      settingsService.soundEnabled
                          ? Icons.volume_up_outlined
                          : Icons.volume_off_outlined,
                    ),
                    onPressed: () => settingsService.toggleSound(),
                  ),
                  ScaleTransition(
                    scale: _hintIconAnimation,
                    child: Badge(
                      label: Text('$hintsLeft'),
                      isLabelVisible: hintsLeft > 0 &&
                          gameState?.status == GameStatus.playing,
                      child: IconButton(
                        icon: Icon(
                          Icons.lightbulb_outline,
                          color: gameService.canUseHint
                              ? Colors.yellow.shade700
                              : null,
                        ),
                        onPressed: gameService.canUseHint
                            ? () {
                                gameService.useHint();
                              }
                            : null,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
