import 'package:games/core/error/failure.dart';
import 'package:games/core/utils/app_const.dart';
import 'package:games/games/data/models/game_model.dart';

abstract class GameDatasource {
  Future<List<GameModel>> getAllGames();
}

class GameDataSourceImpl implements GameDatasource {
  final ApiService _apiService;

  GameDataSourceImpl(this._apiService);
  @override
  Future<List<GameModel>> getAllGames() async {
    try {
      final res = await _apiService.get(endPoint: 'games');

      return res.map((json) => GameModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerFailure(errMessage: e.toString());
    }
  }
}
