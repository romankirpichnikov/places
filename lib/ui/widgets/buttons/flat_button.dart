import 'package:flutter/material.dart';
import 'package:places/ui/widgets/buttons/custom_botton.dart';

class FlatButton extends CustomBotton {
  const FlatButton({
    Key? key,
    required VoidCallback onPressed,
    required Widget icon,
    Text label = const Text(''),
  }) : super(
          key: key,
          onPressed: onPressed,
          icon: icon,
          label: label,
        );

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
