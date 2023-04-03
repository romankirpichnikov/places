import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/buttons/flat_button.dart';
import 'package:places/ui/widgets/favorities/empty.dart';
import 'package:places/ui/widgets/sight_card.dart';

class Visited extends StatelessWidget {
  final List<Sight> sights;

  const Visited({Key? key, required this.sights}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sights.isEmpty) {
      return Empty(
        icon: SvgPicture.asset(AppIcons.goRoute),
        text: AppStrings.completeRoute,
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: sights.map((sight) {
          return SightCard(
            sight: sight,
            actions: [
              FlatButton(
                onPressed: () {
                  log('Presseed on share button ${sight.name}');
                },
                icon: SvgPicture.asset(AppIcons.share),
              ),
              FlatButton(
                onPressed: () {
                  log('Presseed on cross button ${sight.name}');
                },
                icon: SvgPicture.asset(AppIcons.cross),
              ),
            ],
            content: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                sight.visitedDate(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
