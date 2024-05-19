part of 'themer.dart';

class ThemeManager with ChangeNotifier {
  /// Manages the theme mode for the application.
  /// The default theme mode is set to [ThemeMode.light].
  ThemeMode _themeMode = ThemeMode.light;

  /// Returns the current theme mode.
  ThemeMode get themeMode => _themeMode;

  /// Toggles the theme mode based on the provided [isDark] value.
  ///
  /// If [isDark] is `true`, sets the theme mode to [ThemeMode.dark].
  /// If [isDark] is `false`, sets the theme mode to [ThemeMode.light].
  /// Finally, notifies the listeners about the theme mode change.
  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  /// Returns the current theme as a string.
  ///
  /// If the current theme mode is set to [ThemeMode.light], it returns 'Light Theme'.
  /// If the current theme mode is set to [ThemeMode.dark], it returns 'Dark Theme'.
  String get currentThemeString =>
      _themeMode == ThemeMode.light ? 'Light Theme' : 'Dark Theme';

  /// Returns the current theme mode.
  ///
  /// The theme mode determines the current theme being used in the application.
  /// It can be one of the following values:
  ///   - `ThemeMode.system`: The theme mode follows the system's theme.
  ///   - `ThemeMode.light`: The light theme is used.
  ///   - `ThemeMode.dark`: The dark theme is used.
  ///
  /// Example usage:
  /// ```dart
  /// ThemeMode currentTheme = manager.currentTheme;
  /// ```
  get currentTheme => _themeMode;

  /// Returns the appropriate icon based on the current theme mode.
  /// If the current theme mode is light, it returns the dark mode icon.
  /// If the current theme mode is dark, it returns the light mode icon.
  ///
  /// Returns:
  ///   - The dark mode icon if the current theme mode is light.
  ///   - The light mode icon if the current theme mode is dark.
  get currentThemeIcons =>
      _themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode;
}
