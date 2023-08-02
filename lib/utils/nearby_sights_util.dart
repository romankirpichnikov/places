import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:places/mocks/sights.dart';

int calculateNearbySights(RangeValues rangeValues) {
  final sights = SightsData.sights;
  const centerPoint = {
    'lat': 1,
    'lng': 1,
  }; // stub current position and extract to the attribute

  const kilometersPerDegree = 40000 / 360;

  final minDistanceKm = rangeValues.start;
  final maxDistanceKm = rangeValues.end;

  final xFactor =
      math.cos(math.pi * centerPoint['lat']! / 180.0) * kilometersPerDegree;
  var foundSights = 0;

  for (final sight in sights) {
    final xDistance = (centerPoint['lng']! - sight.lon).abs() * xFactor;
    final yDistance =
        (centerPoint['lat']! - sight.lat).abs() * kilometersPerDegree;
    final distance = math.sqrt(xDistance * xDistance + yDistance * yDistance);

    final isInRange = distance >= minDistanceKm && distance <= maxDistanceKm;

    if (isInRange) {
      foundSights++;
    }
  }

  return foundSights;
}
