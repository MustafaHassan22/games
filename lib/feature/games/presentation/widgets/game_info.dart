import 'package:flutter/material.dart';
import 'package:games/feature/games/domain/entities/game_details/game_details.dart';
import 'package:games/feature/games/presentation/widgets/custom_info_text.dart';
import 'package:url_launcher/url_launcher.dart';

class GameInfoWidget extends StatelessWidget {
  final GameDetails gameDetails;

  const GameInfoWidget({super.key, required this.gameDetails});
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GameInfoText(label: 'Developer', value: gameDetails.developer),
        const SizedBox(height: 8),
        GameInfoText(label: 'Release Date', value: gameDetails.releaseDate),
        const SizedBox(height: 8),
        GestureDetector(
            onTap: () => _launchUrl(gameDetails.freetogameProfileUrl),
            child: const GameInfoText(
              label: 'Web url',
              value: 'Game',
              isLink: true,
            )),
      ],
    );
  }
}
