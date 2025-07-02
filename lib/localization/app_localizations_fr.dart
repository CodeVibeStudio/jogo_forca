// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'Jeu du Pendu Moderne';

  @override
  String get chooseCategory => 'Choisissez une catégorie pour commencer';

  @override
  String get settings => 'Paramètres';

  @override
  String get animals => 'Animaux';

  @override
  String get fruits => 'Fruits';

  @override
  String get objects => 'Objets';

  @override
  String get professions => 'Professions';

  @override
  String get verbs => 'Verbes';

  @override
  String get countries => 'Pays';

  @override
  String get word => 'Mot';

  @override
  String remainingAttempts(int count) {
    return 'Tentatives restantes: $count';
  }

  @override
  String get chooseALetter => 'Choisissez une lettre';

  @override
  String get correct => 'Correct';

  @override
  String get wrong => 'Erreurs';

  @override
  String get remaining => 'Restantes';

  @override
  String get congratulations => 'Félicitations!';

  @override
  String get tooBad => 'Dommage!';

  @override
  String get youFoundTheWord => 'Vous avez trouvé le mot!';

  @override
  String get theWordWas => 'Le mot était:';

  @override
  String get home => 'Accueil';

  @override
  String get playAgain => 'Rejouer';

  @override
  String wordsCount(int count) {
    return '$count mots';
  }
}
