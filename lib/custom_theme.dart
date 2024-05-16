part of 'm_theme_manager.dart';

class CustomTheme {
  Color? primaryColor;
  Color? secondaryColor;
  Color? backgroundColor;
  Color? textColor;
  Color? accentColor;

  CustomTheme({
    this.primaryColor = Colors.orange,
    this.secondaryColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.accentColor = Colors.green,
  });

  ThemeData lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: backgroundColor);
  }

  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundColor,
    );
  }
}
