// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'モダンハングマンゲーム';

  @override
  String get chooseCategory => '開始するカテゴリを選択してください';

  @override
  String get settings => '設定';

  @override
  String get animals => '動物';

  @override
  String get fruits => '果物';

  @override
  String get objects => '物体';

  @override
  String get professions => '職業';

  @override
  String get verbs => '動詞';

  @override
  String get countries => '国';

  @override
  String get word => '単語';

  @override
  String remainingAttempts(int count) {
    return '残り試行回数: $count';
  }

  @override
  String get chooseALetter => '文字を選択してください';

  @override
  String get correct => '正解';

  @override
  String get wrong => '間違い';

  @override
  String get remaining => '残り';

  @override
  String get congratulations => 'おめでとうございます！';

  @override
  String get tooBad => '残念！';

  @override
  String get youFoundTheWord => '単語を見つけました！';

  @override
  String get theWordWas => '単語は:';

  @override
  String get home => 'ホーム';

  @override
  String get playAgain => 'もう一度プレイ';

  @override
  String wordsCount(int count) {
    return '$count 単語';
  }
}
