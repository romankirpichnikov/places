import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';

class AppTextStyles {
  static const lMainTitle = TextStyle(
    color: AppColors.appBarHeader,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 34,
  );

  static const lBaseText = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    color: AppColors.lTextBase,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static final dBaseText = lBaseText.copyWith(
    color: AppColors.dTextBase,
  );

  static final dMainTitle = lMainTitle.copyWith(color: AppColors.white);

  static final baseTextBold = lBaseText.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final lHeavyWeightTitle = lMainTitle.copyWith(
    fontSize: 20,
  );

  static final dHeavyWeightTitle = lHeavyWeightTitle.copyWith(
    color: AppColors.white,
  );

  static final disabledTextBig = lBaseText.copyWith(
    color: AppColors.inactiveColor,
    fontSize: 20,
  );

  static final disabledTextSmall = disabledTextBig.copyWith(
    color: AppColors.inactiveColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static final boldText = lBaseText.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final dBaseTextBold = baseTextBold.copyWith(
    color: AppColors.white,
  );
}
