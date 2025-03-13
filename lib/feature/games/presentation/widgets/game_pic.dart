import 'package:flutter/material.dart';

class GameThumbnailWidget extends StatelessWidget {
  final String thumbnail;

  const GameThumbnailWidget({super.key, required this.thumbnail});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      thumbnail,
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  }
}
