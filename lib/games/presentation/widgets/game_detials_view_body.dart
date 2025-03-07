import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/games/domain/entities/game_details/game_details.dart';
import 'package:games/games/domain/entities/game_details/screenshot.dart';
import 'package:games/games/presentation/controller/cubit/cubit/game_details_cubit.dart';
import 'package:games/games/presentation/widgets/custom_info_text.dart';

class GameDetailsViewBody extends StatelessWidget {
  const GameDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameDetailsCubit, GameDetailsState>(
      builder: (context, state) {
        if (state is GameDetailsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GameDetailsSuccess) {
          return _buildGameDetailsContent(context, state.gameDetails);
        } else if (state is GameDetailsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('No game details available'));
        }
      },
    );
  }

  Widget _buildGameDetailsContent(
      BuildContext context, GameDetails gameDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGameTitle(context, gameDetails.title),
            const SizedBox(height: 16),
            _buildGameThumbnail(gameDetails.thumbnail),
            const SizedBox(height: 16),
            _buildGameDescription(context, gameDetails.description),
            const SizedBox(height: 16),
            _buildGameInfo(context, gameDetails),
            const SizedBox(height: 16),
            _buildScreenshots(context, gameDetails.screenshots),
          ],
        ),
      ),
    );
  }

  Widget _buildGameTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildGameThumbnail(String thumbnail) {
    return Image.network(
      thumbnail,
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
    );
  }

  Widget _buildGameDescription(BuildContext context, String description) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }

  Widget _buildGameInfo(BuildContext context, GameDetails gameDetails) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GameInfoText(label: 'Developer', value: gameDetails.developer),
        const SizedBox(height: 8),
        GameInfoText(label: 'Release Date', value: gameDetails.releaseDate),
        const SizedBox(height: 8),
        GameInfoText(label: 'Rating', value: gameDetails.status),
      ],
    );
  }

  Widget _buildScreenshots(
      BuildContext context, List<Screenshot>? screenshots) {
    if (screenshots == null || screenshots.isEmpty) {
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
            itemCount: screenshots.length,
            itemBuilder: (context, index) {
              final screenshot = screenshots[index];
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
