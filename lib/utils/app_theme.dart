import 'package:flutter/material.dart';

// Paleta de cores para o Tema Claro (Light)
class AppColors {
  static const Color primaryPurple = Color(0xFF8B5FBF);
  static const Color lightPurple = Color(0xFFB19CD9);
  static const Color darkPurple = Color(0xFF6A4C93);
  static const Color accentPurple = Color(0xFFD4C4E8);
  
  static const Color background = Color(0xFFF8F6FF);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFF3F0FF);
  
  static const Color textPrimary = Color(0xFF2D1B3D);
  static const Color textSecondary = Color(0xFF6B5B73);
  // Corrigido: Adicionada de volta para compatibilidade
  static const Color textLight = Color(0xFF9B8AA3);
  
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE57373);
  static const Color warning = Color(0xFFFF9800);

  // Corrigido: Cores da forca adicionadas de volta
  static const Color hangmanBase = Color(0xFF8D6E63);
  static const Color hangmanPole = Color(0xFF5D4037);
  static const Color hangmanRope = Color(0xFFBCAAA4);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryPurple, lightPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background, Color(0xFFEDE7F6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// Paleta de cores para o Tema Escuro (Dark)
class AppColorsDark {
  static const Color background = Color(0xFF1C1B22);
  static const Color surface = Color(0xFF2A2833);
  static const Color primary = Color(0xFFB39DDB);
  static const Color accent = Color(0xFFF48FB1);

  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFBDBDBD);
  // Corrigido: Equivalente escuro para textLight
  static const Color textLight = Color(0xFF9E9E9E);

  static const Color success = Color(0xFF81C784);
  static const Color error = Color(0xFFE57373);
  static const Color warning = Color(0xFFFFB74D);

  // Corrigido: Cores da forca para o tema escuro
  static const Color hangmanBase = Color(0xFF6D4C41);
  static const Color hangmanPole = Color(0xFF4E342E);
  static const Color hangmanRope = Color(0xFFBDBDBD);
  
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background, Color(0xFF23212B)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}


class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryPurple,
        brightness: Brightness.light,
      ),
      fontFamily: 'Poppins',
      // Corrigido: CardTheme -> CardThemeData
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 8,
        shadowColor: AppColors.primaryPurple.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme.dark(
        primary: AppColorsDark.primary,
        secondary: AppColorsDark.accent,
        background: AppColorsDark.background,
        surface: AppColorsDark.surface,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onBackground: AppColorsDark.textPrimary,
        onSurface: AppColorsDark.textPrimary,
        error: AppColorsDark.error,
        onError: Colors.black,
      ),
      scaffoldBackgroundColor: AppColorsDark.background,
      // Corrigido: CardTheme -> CardThemeData
      cardTheme: CardThemeData(
        color: AppColorsDark.surface,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dialogBackgroundColor: AppColorsDark.surface,
    );
  }
}
