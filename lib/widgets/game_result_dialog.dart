import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/game_service.dart';
import '../models/game_state.dart';
import '../utils/app_theme.dart';

class GameResultDialog extends StatelessWidget {
  final VoidCallback onPlayAgain;
  final VoidCallback onBackToHome;

  const GameResultDialog({
    Key? key,
    required this.onPlayAgain,
    required this.onBackToHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Consumer<GameService>(
      builder: (context, gameService, child) {
        // CORRIGIDO: Tornando o acesso ao gameState seguro contra nulos.
        final gameState = gameService.gameState;

        // Se o estado for nulo (durante a transição), retorna uma caixa vazia.
        if (gameState == null) {
          return const SizedBox.shrink();
        }

        final isWon = gameState.status == GameStatus.won;
        final score = gameService.lastRoundScore;

        final successColor =
            isDarkMode ? AppColorsDark.success : AppColors.success;
        final errorColor = isDarkMode ? AppColorsDark.error : AppColors.error;
        final warningColor =
            isDarkMode ? AppColorsDark.warning : AppColors.warning;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.colorScheme.surface,
                border: Border.all(color: theme.dividerColor)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildResultIcon(isWon, successColor, errorColor),
                const SizedBox(height: 16),
                Text(
                  isWon ? 'Parabéns!' : 'Que pena!',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: isWon ? successColor : errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isWon && score > 0) ...[
                  const SizedBox(height: 8),
                  Text(
                    '+$score Pontos!',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: successColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                const SizedBox(height: 8),
                Text(
                  isWon ? 'Você descobriu a palavra!' : 'A palavra era:',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.textTheme.bodyLarge?.color?.withOpacity(0.8),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    gameState.currentWord.text,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: isWon ? successColor : errorColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(
                        icon: Icons.check_circle_outline,
                        label: 'Acertos',
                        value:
                            '${gameState.guessedLetters.length - gameState.wrongLetters.length}',
                        color: successColor,
                        context: context),
                    _buildStatItem(
                        icon: Icons.cancel_outlined,
                        label: 'Erros',
                        value: '${gameState.wrongGuessCount}',
                        color: errorColor,
                        context: context),
                    _buildStatItem(
                        icon: Icons.hourglass_bottom_rounded,
                        label: 'Restantes',
                        value: '${gameState.remainingGuesses}',
                        color: warningColor,
                        context: context),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: onBackToHome,
                        icon: const Icon(Icons.home_outlined),
                        label: const Text('Início'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              theme.colorScheme.onSurface.withOpacity(0.7),
                          side: BorderSide(color: theme.dividerColor),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: onPlayAgain,
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('De Novo'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.colorScheme.primary,
                          foregroundColor: theme.colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildResultIcon(bool isWon, Color successColor, Color errorColor) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: (isWon ? successColor : errorColor).withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        isWon
            ? Icons.emoji_events_outlined
            : Icons.sentiment_very_dissatisfied_outlined,
        size: 40,
        color: isWon ? successColor : errorColor,
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodySmall
              ?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
        ),
      ],
    );
  }
}
