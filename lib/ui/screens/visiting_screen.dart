import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/tab_data.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_tab_bar.dart';
import 'package:places/ui/widgets/favorities/planned_to_visit.dart';
import 'package:places/ui/widgets/favorities/visited.dart';

class VisitingScreen extends StatefulWidget {
  final List<Sight> sights;

  const VisitingScreen({super.key, required this.sights});

  @override
  State<VisitingScreen> createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    final tabData = [
      TabData(
        title: AppStrings.wantToVisitTab1,
        sights: widget.sights.where((sight) => !sight.visited).toList(),
      ),
      TabData(
        title: AppStrings.alreadyVisited,
        sights: widget.sights.where((sight) => sight.visited).toList(),
      ),
    ];

    final tabDataViewMaping = tabData.map((data) {
      return data.title == tabData.first.title
          ? PlannedToVisit(sights: data.sights)
          : Visited(sights: data.sights);
    }).toList();

    return DefaultTabController(
      length: tabData.length,
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Theme.of(context).canvasColor,
          title: Text(
            AppStrings.visitingScreenTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          bottom: CustomTabBar(tabData: tabData),
          sizeMultipler: 2.5,
        ),
        body: TabBarView(
          children: tabDataViewMaping,
        ),
      ),
    );
  }
}
