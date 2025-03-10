import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/utils/setup_service_locator.dart';
import 'package:games/feature/games/domain/usecases/get_game_detials_usecase.dart';
import 'package:games/feature/games/presentation/controller/cubit/cubit/game_details_cubit.dart';
import 'package:games/feature/games/presentation/widgets/game_detials_view_body.dart';

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
        child: const GameDetailsViewBody(),
      ),
    );
  }
}
