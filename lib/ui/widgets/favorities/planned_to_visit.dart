import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/favorities/empty.dart';
import 'package:places/ui/widgets/sight_card.dart';

class PlannedToVisit extends StatelessWidget {
  final List<Sight> sights;

  const PlannedToVisit({Key? key, required this.sights}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sights.isEmpty) {
      return Empty(
        icon: SvgPicture.asset(AppIcons.camera),
        text: AppStrings.markFavoritePlaces,
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: sights.map((sight) {
          return SightCard(
            sight: sight,
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: SvgPicture.asset(AppIcons.calendar),
              ),
              SizedBox(
                width: 26,
                height: 26,
                child: SvgPicture.asset(AppIcons.cross),
              ),
            ],
            content: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                sight.planedDate(),
                style: const TextStyle(color: Colors.green),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
