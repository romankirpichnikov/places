import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/constants/domain/app_icons.dart';
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
