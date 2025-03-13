import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/feature/games/domain/entities/game_details/game_details.dart';
import 'package:games/feature/games/presentation/controller/cubit/cubit/game_details_cubit.dart';
import 'package:games/feature/games/presentation/widgets/game_description.dart';
import 'package:games/feature/games/presentation/widgets/game_info.dart';
import 'package:games/feature/games/presentation/widgets/game_pic.dart';
import 'package:games/feature/games/presentation/widgets/game_screenshots.dart';
import 'package:games/feature/games/presentation/widgets/game_title.dart';
import 'package:games/feature/games/presentation/widgets/paypal_payment_button.dart';

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
            GameTitleWidget(title: gameDetails.title),
            const SizedBox(height: 16),
            GameThumbnailWidget(thumbnail: gameDetails.thumbnail),
            const SizedBox(height: 16),
            GameDescriptionWidget(description: gameDetails.description),
            const SizedBox(height: 16),
            GameInfoWidget(gameDetails: gameDetails),
            const SizedBox(height: 16),
            GameScreenshotsWidget(screenshots: gameDetails.screenshots),
            const SizedBox(height: 16),
            PaypalPaymentButton(context: context),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
