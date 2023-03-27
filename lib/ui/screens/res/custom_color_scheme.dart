import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_colors.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  static const light = CustomColors(
    buttonIcon: AppColors.lBottomIcon,
    cardbackground: AppColors.lCardBacground,
    favoriteBackground: AppColors.lFavoriteBackground,
  );
  static const dark = CustomColors(
    buttonIcon: AppColors.dBottomIcon,
    cardbackground: AppColors.dCardBacground,
    favoriteBackground: AppColors.dFavoriteBackground,
  );

  final Color buttonIcon;
  final Color cardbackground;
  final Color favoriteBackground;

  const CustomColors({
    this.buttonIcon = Colors.transparent,
    this.cardbackground = Colors.transparent,
    this.favoriteBackground = Colors.transparent,
  });

  @override
  CustomColors copyWith() {
    return CustomColors(
      buttonIcon: buttonIcon,
      cardbackground: cardbackground,
      favoriteBackground: favoriteBackground,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    return other is CustomColors
        ? CustomColors(
            buttonIcon: Color.lerp(buttonIcon, other.buttonIcon, t)!,
            cardbackground:
                Color.lerp(cardbackground, other.cardbackground, t)!,
            favoriteBackground:
                Color.lerp(favoriteBackground, other.favoriteBackground, t)!,
          )
        : this;
  }
}
