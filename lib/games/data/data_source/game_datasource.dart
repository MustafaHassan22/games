import 'package:games/core/error/failure.dart';
import 'package:games/core/utils/api_service.dart';
import 'package:games/games/data/models/game_detials_model.dart';
import 'package:games/games/data/models/game_model.dart';
import 'package:games/games/domain/usecases/get_game_detials_usecase.dart';

abstract class GameDatasource {
  Future<List<GameModel>> getAllGames();
  Future<GameDetialsModel> getGameDetials({required GameDetialsParam gameId});
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

  @override
  Future<GameDetialsModel> getGameDetials(
      {required GameDetialsParam gameId}) async {
    try {
      final res = await _apiService.gett(endPoint: 'game?id=$gameId');

      return GameDetialsModel.fromJson(res);
    } catch (e) {
      throw ServerFailure(errMessage: e.toString());
    }
  }
}
