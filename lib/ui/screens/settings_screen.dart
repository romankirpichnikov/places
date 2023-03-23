import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/themes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = AppTheme.isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isDarkMode ? 'Dark' : 'Light'),
            Switch(
              value: isDarkMode,
              onChanged: _toggleTheme,
            ),
          ],
        ),
      ),
    );
  }

  void _toggleTheme(bool value) {
    return setState(() {
      isDarkMode = value;
      AppTheme.isDark = isDarkMode;
    });
  }
}
