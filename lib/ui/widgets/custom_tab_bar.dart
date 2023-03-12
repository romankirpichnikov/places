import 'package:flutter/material.dart';
import 'package:places/domain/tab_data.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<TabData> tabData;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 24);

  const CustomTabBar({super.key, required this.tabData});

  @override
  Widget build(BuildContext context) {
    const maxWidth = 390.0;
    const backgroundColor = Color.fromRGBO(245, 245, 245, 1);
    const indicatorColor = Color.fromRGBO(59, 62, 91, 1);
    const borderRadius = BorderRadius.all(Radius.circular(20));
    const unselectedLabelColor = Color.fromRGBO(124, 126, 146, 0.56);

    return Container(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      decoration: const BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
      ),
      child: TabBar(
        indicator: const BoxDecoration(
          color: indicatorColor,
          borderRadius: borderRadius,
        ),
        unselectedLabelColor: unselectedLabelColor,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        tabs: tabData
            .map((data) => Tab(
                  height: 40,
                  text: data.title,
                ))
            .toList(),
      ),
    );
  }
}
