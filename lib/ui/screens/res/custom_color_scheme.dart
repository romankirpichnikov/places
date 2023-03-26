import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  static const light = CustomColors(
    buttonIcon: AppColors.lBottomIcon,
    cardbackground: AppColors.lCardBacground,
  );
  static const dark = CustomColors(
    buttonIcon: AppColors.dBottomIcon,
    cardbackground: AppColors.dCardBacground,
  );

  final Color buttonIcon;
  final Color cardbackground;

  const CustomColors({
    this.buttonIcon = Colors.transparent,
    this.cardbackground = Colors.transparent,
  });

  @override
  CustomColors copyWith() {
    return CustomColors(
      buttonIcon: buttonIcon,
      cardbackground: cardbackground,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    return other is CustomColors
        ? CustomColors(buttonIcon: Color.lerp(buttonIcon, other.buttonIcon, t)!)
        : this;
  }
}
