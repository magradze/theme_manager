part of 'themer.dart';

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
        iconTheme: IconThemeData(
          color: primaryColor!.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
      ),
      scaffoldBackgroundColor: backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          foregroundColor: MaterialStateColor.resolveWith(
            (states) => primaryColor!.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          iconColor: MaterialStateColor.resolveWith(
            (states) => primaryColor!.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      cardColor: Colors.white,
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
          backgroundColor: MaterialStateProperty.all(primaryColor),
          foregroundColor: MaterialStateColor.resolveWith(
            (states) => primaryColor!.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          iconColor: MaterialStateColor.resolveWith(
            (states) => primaryColor!.computeLuminance() > 0.5
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      cardColor: Colors.black,
    ); 
  }
}
