import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget icon;
  final Widget label;

  const CustomBotton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: label,
      style: OutlinedButton.styleFrom(
        side: BorderSide.none,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
