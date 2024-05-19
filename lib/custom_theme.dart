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
