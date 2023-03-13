import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/widgets/bottom_navigator.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        child: Scaffold(
          body: SightListScreen(sights: mocks),
          bottomNavigationBar: const BottomNavigation(),
        ),
        length: 2,
      ),
    );
  }
}
