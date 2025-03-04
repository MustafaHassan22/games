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
    try {
      final games = await gameRepo.getGames();
      return right(games);
    } on ServerFailure catch (e) {
      return left(ServerFailure(errMessage: e.errMessage.toString()));
    }
  }
}
