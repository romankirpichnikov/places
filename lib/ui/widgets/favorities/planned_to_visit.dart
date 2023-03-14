import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_card.dart';

class PlannedToVisit extends StatelessWidget {
  final Sight sight;

  const PlannedToVisit({Key? key, required this.sight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SightCard(
        sight: sight,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 22,
            height: 20,
            child: SvgPicture.asset(AppIcons.heart),
          ),
          SizedBox(
            width: 22,
            height: 20,
            child: SvgPicture.asset(AppIcons.heart),
          ),
        ],
      ),
    );
  }
}
