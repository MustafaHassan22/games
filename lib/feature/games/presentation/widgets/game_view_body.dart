import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/feature/games/presentation/controller/cubit/games_cubit.dart';
import 'package:games/feature/games/presentation/views/game_detials_view.dart';
import 'package:games/feature/games/presentation/widgets/custom_card.dart';

class GameViewBody extends StatelessWidget {
  const GameViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamesCubit, GamesState>(
      builder: (context, state) {
        if (state is GamesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GamesSuccess) {
          return GridView.builder(
            padding: const EdgeInsets.all(12), // Add padding around the grid
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Two cards per row
              crossAxisSpacing: 12, // Spacing between columns
              mainAxisSpacing: 12, // Spacing between rows
              childAspectRatio: 0.75, // Adjust card aspect ratio (width/height)
            ),
            itemCount: state.games.length,
            itemBuilder: (context, index) {
              final game = state.games[index];
              return CustomCard(
                game: game,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GameDetailsView(gameId: game.id);
                  }));
                },
              );
            },
          );
        } else if (state is GamesFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('No games available'));
        }
      },
    );
  }
}
