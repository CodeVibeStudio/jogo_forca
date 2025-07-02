import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh')
  ];

  /// Título do aplicativo
  ///
  /// In pt, this message translates to:
  /// **'WordRope'**
  String get appTitle;

  /// Subtítulo do aplicativo
  ///
  /// In pt, this message translates to:
  /// **'Jogo da Forca Moderno'**
  String get appSubtitle;

  /// Instrução para escolher categoria
  ///
  /// In pt, this message translates to:
  /// **'Escolha uma categoria para começar'**
  String get chooseCategory;

  /// Botão de configurações
  ///
  /// In pt, this message translates to:
  /// **'Configurações'**
  String get settings;

  /// Categoria animais
  ///
  /// In pt, this message translates to:
  /// **'Animais'**
  String get animals;

  /// Categoria frutas
  ///
  /// In pt, this message translates to:
  /// **'Frutas'**
  String get fruits;

  /// Categoria objetos
  ///
  /// In pt, this message translates to:
  /// **'Objetos'**
  String get objects;

  /// Categoria profissões
  ///
  /// In pt, this message translates to:
  /// **'Profissões'**
  String get professions;

  /// Categoria verbos
  ///
  /// In pt, this message translates to:
  /// **'Verbos'**
  String get verbs;

  /// Categoria países
  ///
  /// In pt, this message translates to:
  /// **'Países'**
  String get countries;

  /// Label para palavra
  ///
  /// In pt, this message translates to:
  /// **'Palavra'**
  String get word;

  /// Tentativas restantes
  ///
  /// In pt, this message translates to:
  /// **'Tentativas restantes: {count}'**
  String remainingAttempts(int count);

  /// Instrução do teclado
  ///
  /// In pt, this message translates to:
  /// **'Escolha uma letra'**
  String get chooseALetter;

  /// Acertos
  ///
  /// In pt, this message translates to:
  /// **'Acertos'**
  String get correct;

  /// Erros
  ///
  /// In pt, this message translates to:
  /// **'Erros'**
  String get wrong;

  /// Restantes
  ///
  /// In pt, this message translates to:
  /// **'Restantes'**
  String get remaining;

  /// Mensagem de vitória
  ///
  /// In pt, this message translates to:
  /// **'Parabéns!'**
  String get congratulations;

  /// Mensagem de derrota
  ///
  /// In pt, this message translates to:
  /// **'Que pena!'**
  String get tooBad;

  /// Mensagem de vitória detalhada
  ///
  /// In pt, this message translates to:
  /// **'Você descobriu a palavra!'**
  String get youFoundTheWord;

  /// Mensagem de derrota detalhada
  ///
  /// In pt, this message translates to:
  /// **'A palavra era:'**
  String get theWordWas;

  /// Botão início
  ///
  /// In pt, this message translates to:
  /// **'Início'**
  String get home;

  /// Botão jogar novamente
  ///
  /// In pt, this message translates to:
  /// **'Jogar Novamente'**
  String get playAgain;

  /// Contador de palavras
  ///
  /// In pt, this message translates to:
  /// **'{count} palavras'**
  String wordsCount(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fr',
        'it',
        'ja',
        'pt',
        'ru',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
