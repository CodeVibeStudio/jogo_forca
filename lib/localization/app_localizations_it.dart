// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'Gioco dell\'Impiccato Moderno';

  @override
  String get chooseCategory => 'Scegli una categoria per iniziare';

  @override
  String get settings => 'Impostazioni';

  @override
  String get animals => 'Animali';

  @override
  String get fruits => 'Frutta';

  @override
  String get objects => 'Oggetti';

  @override
  String get professions => 'Professioni';

  @override
  String get verbs => 'Verbi';

  @override
  String get countries => 'Paesi';

  @override
  String get word => 'Parola';

  @override
  String remainingAttempts(int count) {
    return 'Tentativi rimanenti: $count';
  }

  @override
  String get chooseALetter => 'Scegli una lettera';

  @override
  String get correct => 'Corretti';

  @override
  String get wrong => 'Errori';

  @override
  String get remaining => 'Rimanenti';

  @override
  String get congratulations => 'Congratulazioni!';

  @override
  String get tooBad => 'Peccato!';

  @override
  String get youFoundTheWord => 'Hai trovato la parola!';

  @override
  String get theWordWas => 'La parola era:';

  @override
  String get home => 'Home';

  @override
  String get playAgain => 'Gioca Ancora';

  @override
  String wordsCount(int count) {
    return '$count parole';
  }
}
