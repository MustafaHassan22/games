import 'package:dio/dio.dart';
import 'package:games/core/utils/api_service.dart';
import 'package:games/feature/auth/data/data_sorce/auth_remote_data_source.dart';
import 'package:games/feature/auth/data/repo/auth_repo_impl.dart';
import 'package:games/feature/auth/domain/repo/auth_repo.dart';
import 'package:games/feature/auth/domain/use_cases/login_usecase.dart';
import 'package:games/feature/auth/domain/use_cases/sign_up_usecase.dart';
import 'package:games/feature/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:games/feature/games/data/data_source/game_datasource.dart';
import 'package:games/feature/games/data/repo/game_repo_impl.dart';
import 'package:games/feature/games/domain/repo/game_repo.dart';
import 'package:games/feature/games/domain/usecases/get_game_detials_usecase.dart';
import 'package:games/feature/games/domain/usecases/get_games_usecase.dart';
import 'package:games/feature/games/presentation/controller/cubit/cubit/game_details_cubit.dart';
import 'package:games/feature/games/presentation/controller/cubit/games_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton(() => Dio());
  sl.registerFactory(() => ApiService(sl<Dio>()));

  _registerGameDependencies();
  _registerAuthDependencies();
}

void _registerAuthDependencies() {
  //data sources
  sl
    ..registerFactory<FirebaseAuthRemoteDataSource>(
      () => FireBaseAuthRemoteDataSourceImpl(),
    )
    //repo
    ..registerFactory<AuthRepo>(
      () => AuthRepoImpl(sl()),
    )
    //usecases
    ..registerFactory(
      () => SignUpUsecase(sl()),
    )
    ..registerFactory(
      () => LoginUsecase(sl()),
    )
    //auth cubit
    ..registerLazySingleton(() => AuthCubit(
          signUpUsecase: sl(),
          loginUsecase: sl(),
        ));
}

void _registerGameDependencies() {
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
    ..registerFactory(
      () => GetGameDetialsUsecase(sl()),
    )
    //cubit
    ..registerLazySingleton(
      () => GamesCubit(getGameUsecase: sl()),
    )
    ..registerLazySingleton(
      () => GameDetailsCubit(getGameDetailsUsecase: sl()),
    );
}
