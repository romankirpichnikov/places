import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_strings.dart';
import 'package:places/ui/screens/res/custom_color_scheme.dart';

class ClearButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ClearButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).extension<CustomColors>();

    return TextButton(
      onPressed: onPressed,
      child: Text(
        AppStrings.clear,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: customTheme?.clearButton,
        ),
      ),
    );
  }
}
