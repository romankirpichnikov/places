import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/domain/tab_data.dart';
import 'package:places/ui/screens/res/custom_color_scheme.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<TabData> tabData;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 24);

  const CustomTabBar({super.key, required this.tabData});

  @override
  Widget build(BuildContext context) {
    const maxWidth = 390.0;
    const borderRadius = BorderRadius.all(Radius.circular(20));

    return Container(
      constraints: const BoxConstraints(maxWidth: maxWidth),
      decoration: const BoxDecoration(
        borderRadius: borderRadius,
        color: AppColors.backgroundColor,
      ),
      child: TabBar(
        indicator: BoxDecoration(
          color: Theme.of(context).extension<CustomColors>()?.buttonIcon,
          borderRadius: borderRadius,
        ),
        unselectedLabelColor: AppColors.inactiveColor,
        labelStyle: AppTextStyles.boldText,
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
