// lib/widgets/hangman_drawing.dart

import 'package:flutter/material.dart';

class HangmanDrawing extends StatelessWidget {
  final int wrongGuesses;
  final double size;

  const HangmanDrawing({
    Key? key,
    required this.wrongGuesses,
    this.size = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final stickFigureColor = theme.colorScheme.onBackground;
    final gallowsColor = theme.colorScheme.secondary;
    final ropeColor = Colors.brown[400]!;

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: HangmanPainter(
          wrongGuesses: wrongGuesses,
          gallowsColor: gallowsColor,
          ropeColor: ropeColor,
          stickFigureColor: stickFigureColor,
        ),
        size: Size(size, size),
      ),
    );
  }
}

class HangmanPainter extends CustomPainter {
  final int wrongGuesses;
  final Color gallowsColor;
  final Color ropeColor;
  final Color stickFigureColor;

  HangmanPainter({
    required this.wrongGuesses,
    required this.gallowsColor,
    required this.ropeColor,
    required this.stickFigureColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // --- DESENHO DA FORCA (SEMPRE VISÍVEL) ---
    paint.color = gallowsColor;
    // Base
    canvas.drawLine(Offset(size.width * 0.1, size.height * 0.9), Offset(size.width * 0.9, size.height * 0.9), paint);
    // Mastro Principal
    canvas.drawLine(Offset(size.width * 0.2, size.height * 0.9), Offset(size.width * 0.2, size.height * 0.1), paint);
    // Mastro Superior
    canvas.drawLine(Offset(size.width * 0.2, size.height * 0.1), Offset(size.width * 0.6, size.height * 0.1), paint);

    // --- DESENHO DO BONECO (POR PARTES, 8 ERROS) ---
    
    // 1. Corda
    if (wrongGuesses >= 1) {
      paint.color = ropeColor;
      canvas.drawLine(Offset(size.width * 0.6, size.height * 0.1), Offset(size.width * 0.6, size.height * 0.25), paint);
    }
    
    paint.color = stickFigureColor;
    
    // 2. Cabeça
    if (wrongGuesses >= 2) {
      canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.32), size.width * 0.07, paint);
    }
    // 3. Tronco
    if (wrongGuesses >= 3) {
      canvas.drawLine(Offset(size.width * 0.6, size.height * 0.39), Offset(size.width * 0.6, size.height * 0.65), paint);
    }
    // 4. Braço Direito
    if (wrongGuesses >= 4) {
      canvas.drawLine(Offset(size.width * 0.6, size.height * 0.45), Offset(size.width * 0.7, size.height * 0.55), paint);
    }
    // 5. Braço Esquerdo
    if (wrongGuesses >= 5) {
      canvas.drawLine(Offset(size.width * 0.6, size.height * 0.45), Offset(size.width * 0.5, size.height * 0.55), paint);
    }
    // 6. Perna Direita
    if (wrongGuesses >= 6) {
      canvas.drawLine(Offset(size.width * 0.6, size.height * 0.65), Offset(size.width * 0.7, size.height * 0.8), paint);
    }
    // 7. Perna Esquerda
    if (wrongGuesses >= 7) {
      canvas.drawLine(Offset(size.width * 0.6, size.height * 0.65), Offset(size.width * 0.5, size.height * 0.8), paint);
    }
    // 8. Rosto de "Derrota"
    if (wrongGuesses >= 8) {
      final headCenter = Offset(size.width * 0.6, size.height * 0.32);
      final eyeRadius = size.width * 0.015;
      final eyeOffsetX = size.width * 0.025;
      
      // Olho esquerdo em X
      final leftEyeCenter = headCenter.translate(-eyeOffsetX, -eyeRadius);
      canvas.drawLine(leftEyeCenter.translate(-eyeRadius, -eyeRadius), leftEyeCenter.translate(eyeRadius, eyeRadius), paint);
      canvas.drawLine(leftEyeCenter.translate(eyeRadius, -eyeRadius), leftEyeCenter.translate(-eyeRadius, eyeRadius), paint);
      
      // Olho direito em X
      final rightEyeCenter = headCenter.translate(eyeOffsetX, -eyeRadius);
      canvas.drawLine(rightEyeCenter.translate(-eyeRadius, -eyeRadius), rightEyeCenter.translate(eyeRadius, eyeRadius), paint);
      canvas.drawLine(rightEyeCenter.translate(eyeRadius, -eyeRadius), rightEyeCenter.translate(-eyeRadius, eyeRadius), paint);
    }
  }

  @override
  bool shouldRepaint(HangmanPainter oldDelegate) {
    return oldDelegate.wrongGuesses != wrongGuesses ||
           oldDelegate.stickFigureColor != stickFigureColor ||
           oldDelegate.gallowsColor != gallowsColor ||
           oldDelegate.ropeColor != ropeColor;
  }
}