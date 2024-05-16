part of 'themer.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  get currentThemeString =>
      _themeMode == ThemeMode.light ? 'Light Theme' : 'Dark Theme';

  get currentTheme => _themeMode;

  get currentThemeIcons =>
      _themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode;
}
