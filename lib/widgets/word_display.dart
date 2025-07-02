import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class WordDisplay extends StatelessWidget {
  final String displayWord;
  final bool isComplete;

  const WordDisplay({
    Key? key,
    required this.displayWord,
    required this.isComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Animação sutil para quando a palavra é completada
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: isComplete
            ? theme.colorScheme.primary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 40, // Altura fixa para o FittedBox funcionar bem
        // FittedBox garante que o texto se ajuste sem quebrar a linha.
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            // O displayWord já vem com espaços (Ex: 'L A R A N J A')
            displayWord,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              // O espaçamento agora é controlado pelo próprio texto
              letterSpacing: 6,
              color: isComplete
                  ? theme.colorScheme.primary
                  : theme.textTheme.headlineMedium?.color,
            ),
          ),
        ),
      ),
    );
  }
}
