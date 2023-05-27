import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/app_text_styles.dart';

class DistanceSlider extends StatelessWidget {
  final RangeValues rangeValues;
  final ValueChanged<RangeValues> onChanged;
  final ValueChanged<RangeValues> onChangeEnd;

  const DistanceSlider({
    super.key,
    required this.rangeValues,
    required this.onChanged,
    required this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.distance,
          style: AppTextStyles.baseTextBold,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'от ${_formatDistance(rangeValues.start)} ',
              style: AppTextStyles.baseTextBold,
            ),
            Text(
              'до ${_formatDistance(rangeValues.end)}',
              style: AppTextStyles.baseTextBold,
            ),
          ],
        ),
        const SizedBox(height: 16),
        SliderTheme(
          data: const SliderThemeData(
            activeTrackColor: AppColors.lightGreen,
            thumbColor: AppColors.white,
            trackHeight: 1,
          ),
          child: RangeSlider(
            values: rangeValues,
            min: 100, // 100m
            max: 100000, // 100km
            divisions: 100,
            onChanged: onChanged,
            onChangeEnd: onChangeEnd,
          ),
        ),
      ],
    );
  }

  String _formatDistance(double distance) {
    return distance >= 1000
        ? '${(distance / 1000).toStringAsFixed(1)} км'
        : '${distance.toStringAsFixed(0)} м';
  }
}
