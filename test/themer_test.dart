import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:themer/themer.dart';

void main() {
  test('adds one to input values', () {
    final themeManager = ThemeManager();
    expect(themeManager.themeMode, ThemeMode.light);
    themeManager.toggleTheme(true);
    expect(themeManager.themeMode, ThemeMode.dark);
  });
}
