import 'package:flutter/material.dart';
import 'package:places/constants/domain/app_strings.dart';

class ShowButton extends StatelessWidget {
  final bool isButtonActive;
  final int foundSightsCount;

  const ShowButton({
    super.key,
    required this.isButtonActive,
    required this.foundSightsCount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 800,
      // size: const Size.fromHeight(48),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: isButtonActive ? Colors.green : Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: isButtonActive ? () {} : null,
        child: Text('${AppStrings.showPlaces} ($foundSightsCount)'),
      ),
    );
  }
}
