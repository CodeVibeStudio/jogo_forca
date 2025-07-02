// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'Modern Hangman Game';

  @override
  String get chooseCategory => 'Choose a category to start';

  @override
  String get settings => 'Settings';

  @override
  String get animals => 'Animals';

  @override
  String get fruits => 'Fruits';

  @override
  String get objects => 'Objects';

  @override
  String get professions => 'Professions';

  @override
  String get verbs => 'Verbs';

  @override
  String get countries => 'Countries';

  @override
  String get word => 'Word';

  @override
  String remainingAttempts(int count) {
    return 'Remaining attempts: $count';
  }

  @override
  String get chooseALetter => 'Choose a letter';

  @override
  String get correct => 'Correct';

  @override
  String get wrong => 'Wrong';

  @override
  String get remaining => 'Remaining';

  @override
  String get congratulations => 'Congratulations!';

  @override
  String get tooBad => 'Too bad!';

  @override
  String get youFoundTheWord => 'You found the word!';

  @override
  String get theWordWas => 'The word was:';

  @override
  String get home => 'Home';

  @override
  String get playAgain => 'Play Again';

  @override
  String wordsCount(int count) {
    return '$count words';
  }
}
