import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/core/usecase/usecase.dart';
import 'package:games/games/domain/entities/game_details/game_details.dart';
import 'package:games/games/domain/repo/game_repo.dart';

class GetGameDetialsUsecase extends UseCase<GameDetails, GameDetialsParam> {
  final GameRepo gameRepo;

  GetGameDetialsUsecase(this.gameRepo);
  @override
  Future<Either<Failure, GameDetails>> call(GameDetialsParam param) async {
    return await gameRepo.getGameDetials(gameId: param);
  }
}

class GameDetialsParam extends Equatable {
  final int id;

  const GameDetialsParam({required this.id});

  @override
  List<Object?> get props => [id];
}
