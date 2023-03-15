import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/constants/domain/app_text_styles.dart';

class Empty extends StatelessWidget {
  final Widget icon;

  final String text;

  const Empty({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(height: 20),
        Text(
          AppStrings.empty,
          style: AppTextStyles.disabledTextBig,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: AppTextStyles.disabledTextSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
