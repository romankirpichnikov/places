import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/tab_data.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/sight_list_screen.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_tab_bar.dart';

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
      TabData(
        title: 'Хочу посетить',
        sights: _sights.where((sight) => !sight.visited).toList(),
      ),
      TabData(
        title: 'Посетил',
        sights: _sights.where((sight) => sight.visited).toList(),
      ),
    ];

    return DefaultTabController(
      length: tabData.length,
      child: Scaffold(
        appBar: CustomAppBar(
          title: const Text(
            'Избраное',
            style: TextStyle(
              color: Color.fromRGBO(37, 40, 73, 1),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: CustomTabBar(tabData: tabData),
        ),
        body: TabBarView(
          children: tabData
              .map((data) => SightListScreen(sights: data.sights))
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          items: const [
            BottomNavigationBarItem(label: '1', icon: Icon(Icons.ac_unit)),
            BottomNavigationBarItem(label: '2', icon: Icon(Icons.ac_unit)),
            BottomNavigationBarItem(label: '3', icon: Icon(Icons.ac_unit)),
            BottomNavigationBarItem(label: '4', icon: Icon(Icons.ac_unit)),
          ],
        ),
      ),
    );
  }
}
