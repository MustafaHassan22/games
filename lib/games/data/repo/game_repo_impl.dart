import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/games/data/data_source/game_datasource.dart';
import 'package:games/games/domain/entities/game/game.dart';
import 'package:games/games/domain/repo/game_repo.dart';

class GameRepoImpl extends GameRepo {
  final GameDatasource _datasource;

  GameRepoImpl(this._datasource);
  @override
  Future<Either<Failure, List<Game>>> getGames() async {
    try {
      final games = await _datasource.getAllGames();
      return right(games);
    } on ServerFailure catch (e) {
      return left(ServerFailure(errMessage: e.errMessage));
    }
  }
}
