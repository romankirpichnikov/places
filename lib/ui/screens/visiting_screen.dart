import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/sight_list_screen.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({super.key});

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  final List<Sight> _sights = mocks;

  @override
  Widget build(BuildContext context) {
    final tabData = [
      {
        'title': 'Хочу посетить',
        'sights': _sights.where((sight) => !sight.visited).toList(),
      },
      {
        'title': 'Посетил',
        'sights': _sights.where((sight) => sight.visited).toList(),
      },
    ];

    return DefaultTabController(
      length: tabData.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Избраное'),
          bottom: TabBar(
            tabs: tabData
                .map((data) => Tab(text: data['title'].toString()))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: tabData
              .map((data) =>
                  SightListScreen(sights: data['sights'] as List<Sight>))
              .toList(),
        ),
      ),
    );
  }
}
