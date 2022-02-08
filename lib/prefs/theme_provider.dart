import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF282C38),
      primaryColor: Colors.black,
      colorScheme: const ColorScheme.dark(),
      iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
      indicatorColor: Colors.white,
      primaryColorDark: Colors.white,
      shadowColor: Colors.white,
      splashColor: Colors.white70,
      cardColor: const Color(0xFF1B1D29));

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Color(0xFF7E7D95), opacity: 0.8),
    indicatorColor: const Color(0xFF7E7D95),
    primaryColorDark: Colors.blueGrey.shade900,
    cardColor: Colors.white,
    shadowColor: Colors.grey.shade800, //label color
    splashColor: Colors.grey.shade400,
  );
}
