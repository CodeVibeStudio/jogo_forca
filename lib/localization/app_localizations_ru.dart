// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'Современная игра в виселицу';

  @override
  String get chooseCategory => 'Выберите категорию для начала';

  @override
  String get settings => 'Настройки';

  @override
  String get animals => 'Животные';

  @override
  String get fruits => 'Фрукты';

  @override
  String get objects => 'Предметы';

  @override
  String get professions => 'Профессии';

  @override
  String get verbs => 'Глаголы';

  @override
  String get countries => 'Страны';

  @override
  String get word => 'Слово';

  @override
  String remainingAttempts(int count) {
    return 'Осталось попыток: $count';
  }

  @override
  String get chooseALetter => 'Выберите букву';

  @override
  String get correct => 'Правильно';

  @override
  String get wrong => 'Ошибки';

  @override
  String get remaining => 'Осталось';

  @override
  String get congratulations => 'Поздравляем!';

  @override
  String get tooBad => 'Жаль!';

  @override
  String get youFoundTheWord => 'Вы нашли слово!';

  @override
  String get theWordWas => 'Слово было:';

  @override
  String get home => 'Главная';

  @override
  String get playAgain => 'Играть снова';

  @override
  String wordsCount(int count) {
    return '$count слов';
  }
}
