import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';

import 'services/game_service.dart';
import 'services/purchase_service.dart';
import 'services/theme_service.dart';
import 'utils/app_theme.dart';
import 'pages/home_page.dart';

void main() async {
  // Garante que todos os bindings do Flutter estejam prontos antes de mais nada.
  WidgetsFlutterBinding.ensureInitialized();
/*
  if (defaultTargetPlatform == TargetPlatform.android) {
    InAppPurchaseAndroidPlatformAddition.enablePendingPurchases();
  } */

  // Inicializa o AdMob SDK (para plataformas não-web)
  if (!kIsWeb) {
    await MobileAds.instance.initialize();
  }

  // Carrega as preferências salvas no dispositivo
  final prefs = await SharedPreferences.getInstance();

  runApp(
    // MultiProvider é o widget que disponibiliza todos os seus serviços para a árvore de widgets.
    MultiProvider(
      providers: [
        // 1. ThemeService é criado primeiro, pois não depende de outros serviços.
        ChangeNotifierProvider(create: (_) => ThemeService(prefs)),

        // 2. GameService é criado em seguida. Ele precisa do ThemeService, mas não do PurchaseService.
        ChangeNotifierProvider(
          create: (context) => GameService(
            prefs,
            context.read<ThemeService>(),
          ),
        ),

        // 3. PurchaseService é criado por último usando um ProxyProvider.
        // Isso permite que ele tenha acesso à instância já criada do GameService.
        ChangeNotifierProxyProvider<GameService, PurchaseService>(
          // A função 'create' é chamada na primeira vez que o provider é construído.
          create: (context) => PurchaseService(),

          // A função 'update' é chamada para passar a instância do GameService para o PurchaseService.
          update: (context, gameService, previousPurchaseService) {
            // Garante que o serviço de compras tenha uma referência ao serviço de jogo
            // para poder chamar o método 'activatePremium()' após uma compra.
            previousPurchaseService!.setGameService(gameService);
            return previousPurchaseService;
          },
        ),
      ],
      child: ShowCaseWidget(
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
