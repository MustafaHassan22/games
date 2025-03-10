import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games/feature/games/domain/entities/game_details/game_details.dart';
import 'package:games/feature/games/domain/usecases/get_game_detials_usecase.dart';

part 'game_details_state.dart';

class GameDetailsCubit extends Cubit<GameDetailsState> {
  final GetGameDetialsUsecase _gameDetialsUsecase;
  GameDetailsCubit({required GetGameDetialsUsecase getGameDetailsUsecase})
      : _gameDetialsUsecase = getGameDetailsUsecase,
        super(GameDetailsInitial());

  Future<void> getGameDetials(GameDetialsParam gameId) async {
    emit(GameDetailsLoading());
    final res = await _gameDetialsUsecase.call(gameId);
    res.fold(
      (l) => emit(GameDetailsFailure(errMessage: l.errMessage)),
      (gameDetials) => emit(GameDetailsSuccess(gameDetials)),
    );
  }
}
