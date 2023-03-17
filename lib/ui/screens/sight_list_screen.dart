import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/sight_card.dart';

class SightListScreen extends StatefulWidget {
  final List<Sight> sights;
  const SightListScreen({super.key, required this.sights});

  @override
  State<SightListScreen> createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppBarTitleSightList(),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: widget.sights.map((sight) {
            return SightCard(
              sight: sight,
              actions: [
                SvgPicture.asset(AppIcons.heart),
              ],
            );
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
        style: AppTextStyles.mainTitle,
        children: [
          TextSpan(
            text: AppStrings.sightListTitlePart1,
            style: TextStyle(color: AppColors.green),
          ),
          TextSpan(text: AppStrings.sightListTitlePart2),
          TextSpan(
            text: AppStrings.sightListTitlePart3,
            style: TextStyle(color: AppColors.yellow),
          ),
          TextSpan(text: AppStrings.sightListTitlePart4),
        ],
      ),
    );
  }
}
