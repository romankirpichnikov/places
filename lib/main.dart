import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFirstWidget(
        title: 'Hello!',
      ),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  final String title;

  MyFirstWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    print('Context: ${_contextRruntime()}');

    return Container(
      child: Center(
        child: Text(title),
      ),
    );
  }

  Type _contextRruntime() {
    return runtimeType;
  }
}
