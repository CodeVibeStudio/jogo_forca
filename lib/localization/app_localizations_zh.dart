// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => '现代猜词游戏';

  @override
  String get chooseCategory => '选择一个类别开始';

  @override
  String get settings => '设置';

  @override
  String get animals => '动物';

  @override
  String get fruits => '水果';

  @override
  String get objects => '物品';

  @override
  String get professions => '职业';

  @override
  String get verbs => '动词';

  @override
  String get countries => '国家';

  @override
  String get word => '单词';

  @override
  String remainingAttempts(int count) {
    return '剩余尝试次数: $count';
  }

  @override
  String get chooseALetter => '选择一个字母';

  @override
  String get correct => '正确';

  @override
  String get wrong => '错误';

  @override
  String get remaining => '剩余';

  @override
  String get congratulations => '恭喜！';

  @override
  String get tooBad => '太遗憾了！';

  @override
  String get youFoundTheWord => '你找到了单词！';

  @override
  String get theWordWas => '单词是:';

  @override
  String get home => '主页';

  @override
  String get playAgain => '再玩一次';

  @override
  String wordsCount(int count) {
    return '$count 个单词';
  }
}
