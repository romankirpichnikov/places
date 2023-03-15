import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_strings.dart';

Widget loadingBuilder(
  BuildContext context,
  Widget child,
  ImageChunkEvent? loadingProgress,
) {
  if (loadingProgress == null) {
    return child;
  }

  final expectedTotalBytes = loadingProgress.expectedTotalBytes;
  final progress = loadingProgress.cumulativeBytesLoaded / expectedTotalBytes!;
  final loadedPercent = (progress * 100).toInt();

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(value: progress),
        const SizedBox(height: 8),
        Text('${AppStrings.loading} $loadedPercent %'),
      ],
    ),
  );
}
