import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/themes.dart';

class ThemeProvider extends ChangeNotifier {
  bool get isDarkMode => _isDarkMode;
  ThemeData get currentTheme => _isDarkMode ? AppTheme.dark : AppTheme.light;
  bool _isDarkMode = false;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
