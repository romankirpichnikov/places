import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';

class AppTextStyles {
  static const mainTitle = TextStyle(
    color: AppColors.appBarHeader,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 34,
  );

  static const baseText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    color: AppColors.textBase,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static final baseTextBold = baseText.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final heavyWeightTitle = mainTitle.copyWith(
    fontSize: 24,
  );

  static final disabledTextBig = baseText.copyWith(
    color: AppColors.inactiveColor,
    fontSize: 20,
  );

  static final disabledTextSmall = disabledTextBig.copyWith(
    color: AppColors.inactiveColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static final boldText = baseText.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final dBaseTextBold = baseTextBold.copyWith(
    color: AppColors.white,
  );
}
