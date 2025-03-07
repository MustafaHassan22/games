import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/core/usecase/usecase.dart';
import 'package:games/games/domain/entities/game/game.dart';
import 'package:games/games/domain/usecases/get_games_usecase.dart';
part 'games_state.dart';

class GamesCubit extends Cubit<GamesState> {
  final GetGamesUsecase _getGamesUsecase;
  final List<Game> allGames = [];
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

  void searchGames(String query) {
    if (state is GamesSuccess) {
      final filterGames = allGames
          .where(
              (game) => game.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(GamesSuccess(filterGames));
    }
  }
}
