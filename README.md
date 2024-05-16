# Themer

**Usage:**

```dart
import 'package:themer/themer.dart';

ThemeManager _themeManager = ThemeManager();

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _themeManager.addListener(themeListener);
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: CustomTheme().lightTheme(),
        darkTheme: CustomTheme(
          primaryColor: Colors.green,
          backgroundColor: Colors.red,
        ).darkTheme(),
        themeMode: _themeManager.themeMode,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Hoppla'),
              actions: [
                IconButton(
                  icon: Icon(
                    _themeManager.themeMode == ThemeMode.light
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                  onPressed: () {
                    _themeManager
                        .toggleTheme(_themeManager.themeMode == ThemeMode.light);
                  },
                ),
              ],
            ),
            body: Container(),
        )
    )
  }
}
```
