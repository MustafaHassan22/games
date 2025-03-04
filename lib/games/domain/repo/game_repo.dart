import 'package:games/games/domain/entities/game/game.dart';

abstract class GameRepo {
  Future<List<Game>> getGames();
}
