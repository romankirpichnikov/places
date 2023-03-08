import 'package:flutter/material.dart';

const double kLoadingProgressIndicatorSize = 24.0;
const int kDefaultExpectedTotalBytes = -1;

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
        CircularProgressIndicator(
          value: progress,
          strokeWidth: kLoadingProgressIndicatorSize / 4,
        ),
        const SizedBox(height: 8),
        Text('Загрузка $loadedPercent %'),
      ],
    ),
  );
}
