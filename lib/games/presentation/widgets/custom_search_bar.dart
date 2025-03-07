import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/games/presentation/controller/cubit/games_cubit.dart';
import 'package:games/games/presentation/views/game_detials_view.dart';
import 'package:games/games/presentation/widgets/custom_card.dart';

class GameSearchDelegate extends SearchDelegate<String> {
  final GamesCubit gamesCubit;

  GameSearchDelegate({required this.gamesCubit});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close the search interface
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Filter games based on the search query
    gamesCubit.searchGames(query);
    return BlocProvider.value(
      value: gamesCubit,
      child: BlocBuilder<GamesCubit, GamesState>(
        builder: (context, state) {
          if (state is GamesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GamesSuccess) {
            final filteredGames = state.games
                .where((game) =>
                    game.title.toLowerCase().contains(query.toLowerCase()))
                .toList();
            if (filteredGames.isEmpty) {
              return const Center(child: Text('No games found'));
            }
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredGames.length,
              itemBuilder: (context, index) {
                final game = filteredGames[index];
                return CustomCard(
                  game: game,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
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
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show suggestions as the user types
    return BlocProvider.value(
      value: gamesCubit,
      child: BlocBuilder<GamesCubit, GamesState>(
        builder: (context, state) {
          if (state is GamesSuccess) {
            final suggestions = state.games
                .where((game) =>
                    game.title.toLowerCase().contains(query.toLowerCase()))
                .toList();
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust based on your design
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75, // Adjust aspect ratio as needed
              ),
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final game = suggestions[index];
                return CustomCard(
                  game: game,
                  onTap: () {
                    query =
                        game.title; // Set the query to the selected suggestion
                    showResults(context); // Show the results
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No suggestions available'));
          }
        },
      ),
    );
  }
}
