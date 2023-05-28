import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';
import 'package:places/constants/domain/app_text_styles.dart';
import 'package:places/ui/screens/res/custom_color_scheme.dart';

class AppTheme {
  static final ThemeData light = ThemeData.light().copyWith(
    extensions: [
      CustomColors.light,
    ],
    canvasColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      bodySmall: AppTextStyles.lBaseText,
      bodyMedium: AppTextStyles.baseTextBold,
      headlineMedium: AppTextStyles.lHeavyWeightTitle,
      bodyLarge: AppTextStyles.lMainTitle,
      labelMedium: AppTextStyles.lSettingsText,
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    extensions: [
      CustomColors.dark,
    ],
    scaffoldBackgroundColor: AppColors.dBaseColor,
    canvasColor: AppColors.dBaseColor,
    textTheme: TextTheme(
      bodySmall: AppTextStyles.dBaseText,
      bodyMedium: AppTextStyles.dBaseTextBold,
      headlineMedium: AppTextStyles.dHeavyWeightTitle,
      bodyLarge: AppTextStyles.dMainTitle,
      labelMedium: AppTextStyles.dSettingsText,
    ),
  );

  static bool isDark = false;
}
