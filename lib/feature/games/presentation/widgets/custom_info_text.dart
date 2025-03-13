import 'package:flutter/material.dart';

class GameInfoText extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;
  final bool isLink;

  const GameInfoText({
    super.key,
    required this.label,
    required this.value,
    this.style,
    this.isLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: isLink ? Colors.blue : null,
              decoration: isLink ? TextDecoration.underline : null,
            ),
          ),
        ),
      ],
    );
  }
}
