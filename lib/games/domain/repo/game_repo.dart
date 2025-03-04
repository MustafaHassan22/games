import 'package:dartz/dartz.dart';
import 'package:games/core/error/failure.dart';
import 'package:games/games/domain/entities/game/game.dart';

abstract class GameRepo {
  Future<Either<Failure, List<Game>>> getGames();
}
