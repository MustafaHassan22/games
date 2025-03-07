import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/games/domain/entities/game/game.dart';
import 'package:games/games/domain/entities/game_details/game_details.dart';
import 'package:games/games/domain/usecases/get_game_detials_usecase.dart';

abstract class GameRepo {
  Future<Either<Failure, List<Game>>> getGames();
  Future<Either<Failure, GameDetails>> getGameDetials(
      {required GameDetialsParam gameId});
}
