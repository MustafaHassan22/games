import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/utils/setup_service_locator.dart';
import 'package:games/feature/games/presentation/controller/cubit/games_cubit.dart';
import 'package:games/feature/games/presentation/widgets/custom_search_bar.dart';
import 'package:games/feature/games/presentation/widgets/game_view_body.dart';

class GamesView extends StatelessWidget {
  const GamesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GamesCubit(getGameUsecase: sl())..getAllGames(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Games List'),
          actions: [
            // Search Button
            Builder(builder: (context) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Open the search interface
                  final gamesCubit = context.read<GamesCubit>();
                  showSearch(
                    context: context,
                    delegate: GameSearchDelegate(gamesCubit: gamesCubit),
                  );
                },
              );
            }),
          ],
        ),
        body: const GameViewBody(),
      ),
    );
  }
}
