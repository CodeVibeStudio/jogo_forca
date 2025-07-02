// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'لعبة الرجل المشنوق الحديثة';

  @override
  String get chooseCategory => 'اختر فئة للبدء';

  @override
  String get settings => 'الإعدادات';

  @override
  String get animals => 'الحيوانات';

  @override
  String get fruits => 'الفواكه';

  @override
  String get objects => 'الأشياء';

  @override
  String get professions => 'المهن';

  @override
  String get verbs => 'الأفعال';

  @override
  String get countries => 'البلدان';

  @override
  String get word => 'الكلمة';

  @override
  String remainingAttempts(int count) {
    return 'المحاولات المتبقية: $count';
  }

  @override
  String get chooseALetter => 'اختر حرفاً';

  @override
  String get correct => 'صحيح';

  @override
  String get wrong => 'خطأ';

  @override
  String get remaining => 'المتبقي';

  @override
  String get congratulations => 'تهانينا!';

  @override
  String get tooBad => 'للأسف!';

  @override
  String get youFoundTheWord => 'لقد وجدت الكلمة!';

  @override
  String get theWordWas => 'كانت الكلمة:';

  @override
  String get home => 'الرئيسية';

  @override
  String get playAgain => 'العب مرة أخرى';

  @override
  String wordsCount(int count) {
    return '$count كلمات';
  }
}
