// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'Jogo da Forca Moderno';

  @override
  String get chooseCategory => 'Escolha uma categoria para começar';

  @override
  String get settings => 'Configurações';

  @override
  String get animals => 'Animais';

  @override
  String get fruits => 'Frutas';

  @override
  String get objects => 'Objetos';

  @override
  String get professions => 'Profissões';

  @override
  String get verbs => 'Verbos';

  @override
  String get countries => 'Países';

  @override
  String get word => 'Palavra';

  @override
  String remainingAttempts(int count) {
    return 'Tentativas restantes: $count';
  }

  @override
  String get chooseALetter => 'Escolha uma letra';

  @override
  String get correct => 'Acertos';

  @override
  String get wrong => 'Erros';

  @override
  String get remaining => 'Restantes';

  @override
  String get congratulations => 'Parabéns!';

  @override
  String get tooBad => 'Que pena!';

  @override
  String get youFoundTheWord => 'Você descobriu a palavra!';

  @override
  String get theWordWas => 'A palavra era:';

  @override
  String get home => 'Início';

  @override
  String get playAgain => 'Jogar Novamente';

  @override
  String wordsCount(int count) {
    return '$count palavras';
  }
}
