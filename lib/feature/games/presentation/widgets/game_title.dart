import 'package:flutter/material.dart';

class GameTitleWidget extends StatelessWidget {
  final String title;

  const GameTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
