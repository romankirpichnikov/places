import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({super.key});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  final Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    const appBarTextStyle = TextStyle(
      color: Colors.black,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontSize: 32,
    );

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            style: appBarTextStyle,
            children: [
              TextSpan(
                text: 'С',
                style: TextStyle(color: Color.fromRGBO(37, 40, 73, 1)),
              ),
              TextSpan(text: 'писок\n'),
              TextSpan(
                text: 'и',
                style: TextStyle(color: Color.fromRGBO(59, 62, 91, 1)),
              ),
              TextSpan(text: 'нтересных мест'),
            ],
          ),
        ),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 64,
        titleSpacing: 16,
        backgroundColor: _backgroundColor,
      ),
      backgroundColor: _backgroundColor,
    );
  }
}
