import 'package:flutter/material.dart';

class GameInfoText extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;

  const GameInfoText({
    super.key,
    required this.label,
    required this.value,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$label: $value',
      style: style ?? Theme.of(context).textTheme.titleMedium,
    );
  }
}
