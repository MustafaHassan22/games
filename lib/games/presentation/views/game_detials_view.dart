import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/utils/setup_service_locator.dart';
import 'package:games/games/domain/usecases/get_game_detials_usecase.dart';
import 'package:games/games/presentation/controller/cubit/cubit/game_details_cubit.dart';

class GameDetailsView extends StatelessWidget {
  final int gameId;

  const GameDetailsView({required this.gameId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Details'),
      ),
      body: BlocProvider(
        create: (context) => GameDetailsCubit(
          getGameDetailsUsecase: sl(),
        )..getGameDetials(GameDetialsParam(id: gameId)),
        child: BlocBuilder<GameDetailsCubit, GameDetailsState>(
          builder: (context, state) {
            if (state is GameDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GameDetailsSuccess) {
              final gameDetails = state.gameDetails;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Game Title
                      Text(
                        gameDetails.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),

                      // Game Thumbnail (if available)

                      Image.network(
                        gameDetails.thumbnail,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),

                      const SizedBox(height: 16),

                      // Game Description
                      Text(
                        gameDetails.description,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),

                      // Developer
                      Text(
                        'Developer: ${gameDetails.developer}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),

                      // Release Date
                      Text(
                        'Release Date: ${gameDetails.releaseDate}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),

                      // Rating
                      Text(
                        'Rating: ${gameDetails.status}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 16),

                      // Screenshots (if available)
                      if (gameDetails.screenshots == null ||
                          gameDetails.screenshots!.isEmpty)
                        const Center(child: Text('No screenshots available'))
                      else
                        Column(
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
                                itemCount: gameDetails.screenshots?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final screenshot =
                                      gameDetails.screenshots![index];
                                  print(
                                      'Loading screenshot: ${screenshot.image}'); // Debugging
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Image.network(
                                      screenshot
                                          .image, // Ensure this is the correct property
                                      width: 200,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        print(
                                            'Failed to load image: ${screenshot.image}'); // Debugging
                                        return const Icon(Icons
                                            .error); // Fallback for invalid URLs
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            } else if (state is GameDetailsFailure) {
              return Center(child: Text(state.errMessage));
            } else {
              return const Center(child: Text('No game details available'));
            }
          },
        ),
      ),
    );
  }
}
