import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/constants/domain/app_icons.dart';
import 'package:places/domain/sight.dart';
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
        text: 'Завершите маршрут, чтобы место попало сюда.',
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
                child: SvgPicture.asset(AppIcons.share),
              ),
              SizedBox(
                width: 26,
                height: 26,
                child: SvgPicture.asset(AppIcons.cross),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}