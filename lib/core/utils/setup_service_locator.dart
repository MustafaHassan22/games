import 'package:dio/dio.dart';
import 'package:games/core/utils/api_service.dart';
import 'package:games/games/data/data_source/game_datasource.dart';
import 'package:games/games/data/repo/game_repo_impl.dart';
import 'package:games/games/domain/repo/game_repo.dart';
import 'package:games/games/domain/usecases/get_games_usecase.dart';
import 'package:games/games/presentation/controller/cubit/games_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton(() => Dio());
  sl.registerFactory(() => ApiService(sl()));
  //data source
  sl
    ..registerFactory<GameDatasource>(
      () => GameDataSourceImpl(sl()),
    )
    //repo
    ..registerFactory<GameRepo>(
      () => GameRepoImpl(sl()),
    )
    //UseCase
    ..registerFactory(
      () => GetGamesUsecase(sl()),
    )
    //cubit
    ..registerLazySingleton(
      () => GamesCubit(getGameUsecase: sl()),
    );
}
