import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/usecase/usecase.dart';
import 'package:games/games/domain/entities/game/game.dart';
import 'package:games/games/domain/usecases/get_games_usecase.dart';
part 'games_state.dart';

class GamesCubit extends Cubit<GamesState> {
  final GetGamesUsecase _getGamesUsecase;
  GamesCubit({
    required GetGamesUsecase getGameUsecase,
  })  : _getGamesUsecase = getGameUsecase,
        super(GamesInitial());

  Future<void> getAllGames() async {
    emit(GamesLoading());
    final res = await _getGamesUsecase.call(const NoParam());
    res.fold(
      (l) => emit(GamesFailure(l.errMessage)),
      (games) => emit(GamesSuccess(games)),
    );
  }
}
