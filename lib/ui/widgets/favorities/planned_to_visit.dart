import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_card.dart';

class PlannedToVisit extends StatelessWidget {
  final Sight sight;

  const PlannedToVisit({super.key, required this.sight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SightCard(
        sight: sight,
      ),
    );
  }
}
