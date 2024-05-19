part of 'themer.dart';

class CustomTheme {
  Color? primaryColor;
  Color? secondaryColor;
  Color? backgroundColor;
  Color? textColor;
  Color? accentColor;
  Color? cardColor;

  CustomTheme({
    this.primaryColor = Colors.orange,
    this.secondaryColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.accentColor = Colors.green,
    this.cardColor,
  });

  /// Returns a light theme with customized colors and styles.
  ///
  /// The light theme is based on the [ThemeData] class and includes properties
  /// such as brightness, primary color, app bar theme, scaffold background color,
  /// elevated button theme, and card color.
  ///
  /// The brightness is set to [Brightness.light] to ensure a light color scheme.
  /// The primary color is used as the background color for the app bar and is also
  /// used to determine the text color for icons and buttons based on its luminance.
  /// The scaffold background color is set to [backgroundColor].
  /// The elevated button theme is customized with a background color, foreground color,
  /// splash factory, and icon color based on the primary color's luminance.
  /// The card color is set to [cardColor].
  ///
  /// Example usage:
  /// ```dart
  /// ThemeData theme = lightTheme();
  /// ```
  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: primaryColor!.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(primaryColor),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) => primaryColor!.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          iconColor: WidgetStateColor.resolveWith(
            (states) => primaryColor!.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      cardColor: cardColor,
    );
  }

  /// Returns a dark theme configuration.
  ///
  /// This method returns a [ThemeData] object that represents a dark theme configuration.
  /// It sets the brightness to [Brightness.dark], sets the primary color, app bar theme,
  /// scaffold background color, elevated button theme, and card color.
  /// The primary color is used for the app bar background color, icon color, and button colors.
  /// The app bar foreground color is set to white, and the icon color is determined based on
  /// the luminance of the primary color.
  /// The scaffold background color is set to the [backgroundColor] value.
  /// The elevated button theme is configured with a custom button style that sets the
  /// background color, foreground color, splash factory, and icon color based on the
  /// luminance of the primary color.
  /// The card color is set to the [cardColor] value, or to grey[900] if [cardColor] is null.
  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: primaryColor!.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(primaryColor),
          foregroundColor: WidgetStateColor.resolveWith(
            (states) => primaryColor!.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          iconColor: WidgetStateColor.resolveWith(
            (states) => primaryColor!.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      cardColor: cardColor ?? Colors.grey[900],
    ); 
  }
}
