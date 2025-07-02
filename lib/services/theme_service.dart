import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService with ChangeNotifier {
  final SharedPreferences _prefs;

  static const _themeKey = 'theme_mode';
  static const _soundKey = 'sound_enabled';
  static const _firstLaunchKey = 'first_launch_done';

  late ThemeMode _themeMode;
  late bool _soundEnabled;

  ThemeService(this._prefs) {
    _loadTheme();
    _loadSoundSetting();
  }

  ThemeMode get themeMode => _themeMode;
  bool get soundEnabled => _soundEnabled;

  void _loadTheme() {
    final themeString = _prefs.getString(_themeKey);
    _themeMode = _stringToThemeMode(themeString ?? 'system');
  }

  void _loadSoundSetting() {
    _soundEnabled = _prefs.getBool(_soundKey) ?? true;
  }

  Future<void> toggleTheme() async {
    _themeMode =
        _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await _prefs.setString(_themeKey, _themeModeToString(_themeMode));
    notifyListeners();
  }

  Future<void> toggleSound() async {
    _soundEnabled = !_soundEnabled;
    await _prefs.setBool(_soundKey, _soundEnabled);
    notifyListeners();
  }

  Future<bool> isFirstLaunch() async {
    return _prefs.getBool(_firstLaunchKey) ?? true;
  }

  Future<void> markFirstLaunchDone() async {
    await _prefs.setBool(_firstLaunchKey, false);
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.light:
        return 'light';
      default:
        return 'system';
    }
  }

  ThemeMode _stringToThemeMode(String mode) {
    switch (mode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
