// virtual_keyboard.dart

import 'package:flutter/material.dart';

class VirtualKeyboard extends StatelessWidget {
  final Function(String) onLetterPressed;
  final Set<String> guessedLetters;
  final Set<String> wrongLetters;
  final bool isGameActive;

  const VirtualKeyboard({
    Key? key,
    required this.onLetterPressed,
    required this.guessedLetters,
    required this.wrongLetters,
    required this.isGameActive,
  }) : super(key: key);

  static const List<List<String>> _keyboardLayout = [
    ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
    ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
    ['Z', 'X', 'C', 'V', 'B', 'N', 'M'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ..._keyboardLayout.map((row) => _buildKeyboardRow(context, row)),
      ],
    );
  }

  Widget _buildKeyboardRow(BuildContext context, List<String> letters) {
    List<Widget> children = [];

    if (letters.length == 9) {
      children.add(const Spacer(flex: 5));
    } else if (letters.length == 7) {
      children.add(const Spacer(flex: 15));
    }

    for (var letter in letters) {
      children.add(
        Expanded(
          flex: 10,
          child: _buildKeyButton(context, letter),
        ),
      );
    }

    if (letters.length == 9) {
      children.add(const Spacer(flex: 5));
    } else if (letters.length == 7) {
      children.add(const Spacer(flex: 15));
    }

    return Row(children: children);
  }

  // ALTERADO: A lógica de estilo foi completamente refeita para um efeito neon mais forte.
  Widget _buildKeyButton(BuildContext context, String letter) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final isCorrect = guessedLetters.contains(letter);
    final isWrong = wrongLetters.contains(letter);
    final isUsed = isCorrect || isWrong;

    // --- DEFINIÇÃO DOS ESTILOS NEON ---
    const neonGreen = Color(0xFF39FF14);
    const neonRed = Color(0xFFFF4141);
    final darkKeyBackground = isDarkMode ? Colors.grey[850] : Colors.grey[700];
    final defaultTextColor = theme.colorScheme.onSurface;

    BoxDecoration decoration;
    TextStyle textStyle;

    if (isWrong) {
      // Estilo NEON VERMELHO
      decoration = BoxDecoration(
        color: darkKeyBackground,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: neonRed,
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: neonRed,
            blurRadius: 20.0,
            spreadRadius: 1.0,
          ),
        ],
      );
      textStyle = const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(color: neonRed, blurRadius: 5.0),
        ],
      );
    } else if (isCorrect) {
      // Estilo NEON VERDE
      decoration = BoxDecoration(
        color: darkKeyBackground,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: neonGreen,
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: neonGreen,
            blurRadius: 20.0,
            spreadRadius: 1.0,
          ),
        ],
      );
      textStyle = const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(color: neonGreen, blurRadius: 5.0),
        ],
      );
    } else {
      // Estilo PADRÃO (não neon)
      decoration = BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.dividerColor.withOpacity(0.5)),
      );
      textStyle = TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color:
            isGameActive ? defaultTextColor : defaultTextColor.withOpacity(0.5),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      // O Container agora é o responsável principal pelo visual
      child: Container(
        height: 52,
        decoration: decoration,
        child: Material(
          color: Colors
              .transparent, // Material fica transparente para mostrar a decoração do Container
          child: InkWell(
            onTap:
                isUsed || !isGameActive ? null : () => onLetterPressed(letter),
            borderRadius: BorderRadius.circular(8),
            child: Center(
              child: Text(letter, style: textStyle),
            ),
          ),
        ),
      ),
    );
  }
}
