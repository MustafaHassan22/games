import 'package:flutter/material.dart';
import 'package:games/feature/games/domain/entities/game_details/game_details.dart';
import 'package:games/feature/games/presentation/widgets/custom_info_text.dart';

class GameInfoWidget extends StatelessWidget {
  final GameDetails gameDetails;

  const GameInfoWidget({super.key, required this.gameDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GameInfoText(label: 'Developer', value: gameDetails.developer),
        const SizedBox(height: 8),
        GameInfoText(label: 'Release Date', value: gameDetails.releaseDate),
        const SizedBox(height: 8),
        GameInfoText(label: 'Rating', value: gameDetails.freetogameProfileUrl),
      ],
    );
  }
}
