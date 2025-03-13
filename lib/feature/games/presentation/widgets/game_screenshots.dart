import 'package:flutter/material.dart';
import 'package:games/feature/games/domain/entities/game_details/screenshot.dart';

class GameScreenshotsWidget extends StatelessWidget {
  final List<Screenshot>? screenshots;

  const GameScreenshotsWidget({super.key, this.screenshots});

  @override
  Widget build(BuildContext context) {
    if (screenshots == null || screenshots!.isEmpty) {
      return const Center(child: Text('No screenshots available'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Screenshots:',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: screenshots!.length,
            itemBuilder: (context, index) {
              final screenshot = screenshots![index];
              return _buildScreenshotItem(screenshot);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildScreenshotItem(Screenshot screenshot) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Image.network(
        screenshot.image,
        width: 200,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error); // Fallback for invalid URLs
        },
      ),
    );
  }
}
