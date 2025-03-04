import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/core/usecase/usecase.dart';
import 'package:games/games/domain/entities/game/game.dart';
import 'package:games/games/domain/repo/game_repo.dart';

class GetGamesUsecase extends UseCase<List<Game>, NoParam> {
  final GameRepo gameRepo;

  GetGamesUsecase(this.gameRepo);
  @override
  Future<Either<Failure, List<Game>>> call(NoParam param) async {
    return await gameRepo.getGames();
  }
}
