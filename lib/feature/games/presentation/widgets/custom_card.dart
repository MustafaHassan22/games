import 'package:flutter/material.dart';
import 'package:games/feature/games/domain/entities/game/game.dart';

class CustomCard extends StatelessWidget {
  final void Function()? onTap;
  final Game game;

  const CustomCard({
    super.key,
    required this.game,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4, // Add shadow to the card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Game Photo
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12), // Match card's rounded corners
              ),
              child: Image.network(
                game.thumbnail,
                height: 120, // Fixed height for the image
                width: double.infinity, // Full width
                fit: BoxFit.cover, // Cover the entire space
              ),
            ),
            // Game Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1, // Limit to one line
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis if text overflows
                    ),
                    const SizedBox(height: 3),
                    Text(
                      game.shortDescription,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      maxLines: 1, // Limit to two lines
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis if text overflows
                    ),
                    const Spacer(),
                    // Show release date if available
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Release Date: ${game.releaseDate}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
