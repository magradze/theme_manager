# Themer

**Screenshot**

<img src="https://raw.githubusercontent.com/magradze/themer/main/assets/themer.gif" width="200">

## Overview

The `themer` package provides a robust solution for managing themes in a Flutter application. It allows for easy switching between light and dark themes and customization of theme colors. The package consists of three main components: the `themer.dart` library file, the `ThemeManager` class, and the `CustomTheme` class.

## Files and Classes

### 1. `themer.dart`

This is the main library file that ties together the `ThemeManager` and `CustomTheme` classes.

```dart
library themer;

import 'package:flutter/material.dart';

part 'custom_theme.dart';
part 'manager.dart';`` 

```

### 2. `manager.dart`

This file contains the `ThemeManager` class, which handles the switching between light and dark themes. It extends `ChangeNotifier` to allow for state changes to be observed.

#### `ThemeManager` Class

```dart
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
```

##### Properties

- `_themeMode`: Stores the current theme mode (light or dark).
- `themeMode`: Getter for the current theme mode.
- `currentThemeString`: Returns a string representation of the current theme.
- `currentTheme`: Getter for the current theme mode.
- `currentThemeIcons`: Returns the appropriate icon for the current theme.

##### Methods

- `toggleTheme(bool isDark)`: Toggles the theme mode based on the `isDark` parameter and notifies listeners.

### 3. `custom_theme.dart`

This file contains the `CustomTheme` class, which defines the color scheme and theme data for both light and dark themes.

#### `CustomTheme` Class

```dart

`part of 'themer.dart';

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
```

##### Properties

- `primaryColor`: The primary color of the theme.
- `secondaryColor`: The secondary color of the theme.
- `backgroundColor`: The background color of the theme.
- `textColor`: The text color of the theme.
- `accentColor`: The accent color of the theme.
- `cardColor`: The card color of the theme.

##### Methods

- `CustomTheme()`: Constructor to initialize theme colors with optional parameters.
- `lightTheme()`: Returns the light theme data.
- `darkTheme()`: Returns the dark theme data.

## Usage

To use the `themer` package, follow these steps:

1. Import the `themer.dart` library.
2. Initialize the `ThemeManager` and `CustomTheme` instances.
3. Use the `ThemeManager` to toggle themes and the `CustomTheme` to define custom color schemes.

### Example

```dart
import 'package:flutter/material.dart';
import 'themer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeManager _themeManager = ThemeManager();
  final CustomTheme _customTheme = CustomTheme(
    primaryColor: Colors.purple,
    secondaryColor: Colors.amber,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    accentColor: Colors.pink,
    cardColor: Colors.blueGrey,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _customTheme.lightTheme(),
      darkTheme: _customTheme.darkTheme(),
      themeMode: _themeManager.themeMode,
      home: HomeScreen(themeManager: _themeManager),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final ThemeManager themeManager;

  HomeScreen({required this.themeManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Manager Example'),
      ),
      body: Center(
        child: Switch(
          value: themeManager.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeManager.toggleTheme(value);
          },
          activeThumbImage: themeManager.currentThemeIcons,
          inactiveThumbImage: themeManager.currentThemeIcons,
        ),
      ),
    );
  }
}
```

This example demonstrates how to set up the `ThemeManager` and `CustomTheme` to enable theme switching in a Flutter application
