import 'package:flutter/material.dart';
import 'package:places/custom_app_bar.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/sight_card.dart';

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
      appBar: CustomAppBar(
        title: const AppBarTitleSightList(),
        centerTitle: false,
        backgroundColor: _backgroundColor,
      ),
      backgroundColor: _backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: mocks.map((sight) {
            return SightCard(sight: sight);
          }).toList(),
        ),
      ),
    );
  }
}

class AppBarTitleSightList extends StatelessWidget {
  const AppBarTitleSightList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
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
    );
  }
}
