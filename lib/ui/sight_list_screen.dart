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
        title: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'С',
                      style: appBarTextStyle.copyWith(
                        color: const Color.fromRGBO(37, 40, 73, 1),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'писок',
                      style: appBarTextStyle,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'и',
                  style: appBarTextStyle.copyWith(
                    color: const Color.fromRGBO(59, 62, 91, 1),
                  ),
                ),
                const Text(
                  'нтересных мест',
                  style: appBarTextStyle,
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: _backgroundColor,
        elevation: 0,
        titleSpacing: 16,
        toolbarHeight: 64,
      ),
      backgroundColor: _backgroundColor,
    );
  }
}
