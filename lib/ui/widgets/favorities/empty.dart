import 'package:flutter/material.dart';

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
    const inactiveColor = Color.fromRGBO(124, 126, 146, 0.56);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(height: 20),
        const Text(
          'Пусто',
          style: TextStyle(
            fontSize: 20,
            color: inactiveColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: inactiveColor,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
