import 'package:flutter/material.dart';

class GameDescriptionWidget extends StatelessWidget {
  final String description;

  const GameDescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
