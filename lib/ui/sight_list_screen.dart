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
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 32,
            ),
            children: [
              TextSpan(
                text: 'С',
                style: TextStyle(color: Colors.green),
              ),
              TextSpan(text: 'писок\n'),
              TextSpan(
                text: 'и',
                style: TextStyle(color: Colors.yellow),
              ),
              TextSpan(text: 'нтересных мест'),
            ],
          ),
        ),
        centerTitle: false,
        backgroundColor: _backgroundColor,
        elevation: 0,
        toolbarHeight: 64,
        titleSpacing: 16,
      ),
      backgroundColor: _backgroundColor,
    );
  }
}
