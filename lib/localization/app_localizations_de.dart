// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'Modernes Galgenmännchen-Spiel';

  @override
  String get chooseCategory => 'Wählen Sie eine Kategorie zum Starten';

  @override
  String get settings => 'Einstellungen';

  @override
  String get animals => 'Tiere';

  @override
  String get fruits => 'Früchte';

  @override
  String get objects => 'Objekte';

  @override
  String get professions => 'Berufe';

  @override
  String get verbs => 'Verben';

  @override
  String get countries => 'Länder';

  @override
  String get word => 'Wort';

  @override
  String remainingAttempts(int count) {
    return 'Verbleibende Versuche: $count';
  }

  @override
  String get chooseALetter => 'Wählen Sie einen Buchstaben';

  @override
  String get correct => 'Richtig';

  @override
  String get wrong => 'Falsch';

  @override
  String get remaining => 'Verbleibend';

  @override
  String get congratulations => 'Glückwunsch!';

  @override
  String get tooBad => 'Schade!';

  @override
  String get youFoundTheWord => 'Sie haben das Wort gefunden!';

  @override
  String get theWordWas => 'Das Wort war:';

  @override
  String get home => 'Startseite';

  @override
  String get playAgain => 'Nochmal spielen';

  @override
  String wordsCount(int count) {
    return '$count Wörter';
  }
}
