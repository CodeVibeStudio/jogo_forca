import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import 'services/game_service.dart';
import 'services/theme_service.dart';
import 'utils/app_theme.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await MobileAds.instance.initialize();
  }

  final prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeService(prefs)),
        ChangeNotifierProvider(
          create: (context) => GameService(
            prefs,
            context.read<ThemeService>(),
          ),
        ),
      ],
      child: ShowCaseWidget(
        // MODIFICADO: A inicialização foi simplificada para a nova versão do pacote.
        // Removemos o 'Builder()' que envolvia o 'WordRopeApp()'.
        builder: (context) => const WordRopeApp(),
      ),
    ),
  );
}

class WordRopeApp extends StatelessWidget {
  const WordRopeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'WordRope - Jogo da Forca Moderno',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeService.themeMode,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('en', 'US'),
          ],
          home: const HomePage(),
          routes: {
            '/home': (context) => const HomePage(),
          },
        );
      },
    );
  }
}
