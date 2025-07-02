// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'WordRope';

  @override
  String get appSubtitle => 'Juego del Ahorcado Moderno';

  @override
  String get chooseCategory => 'Elige una categoría para empezar';

  @override
  String get settings => 'Configuración';

  @override
  String get animals => 'Animales';

  @override
  String get fruits => 'Frutas';

  @override
  String get objects => 'Objetos';

  @override
  String get professions => 'Profesiones';

  @override
  String get verbs => 'Verbos';

  @override
  String get countries => 'Países';

  @override
  String get word => 'Palabra';

  @override
  String remainingAttempts(int count) {
    return 'Intentos restantes: $count';
  }

  @override
  String get chooseALetter => 'Elige una letra';

  @override
  String get correct => 'Aciertos';

  @override
  String get wrong => 'Errores';

  @override
  String get remaining => 'Restantes';

  @override
  String get congratulations => '¡Felicidades!';

  @override
  String get tooBad => '¡Qué lástima!';

  @override
  String get youFoundTheWord => '¡Encontraste la palabra!';

  @override
  String get theWordWas => 'La palabra era:';

  @override
  String get home => 'Inicio';

  @override
  String get playAgain => 'Jugar de Nuevo';

  @override
  String wordsCount(int count) {
    return '$count palabras';
  }
}
