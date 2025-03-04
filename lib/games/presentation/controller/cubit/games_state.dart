part of 'games_cubit.dart';

sealed class GamesState extends Equatable {
  const GamesState();

  @override
  List<Object> get props => [];
}

final class GamesInitial extends GamesState {}

final class GamesLoading extends GamesState {}

final class GamesSuccess extends GamesState {
  final List<Game> games;

  const GamesSuccess(this.games);
}

final class GamesFailure extends GamesState {
  final String errMessage;

  const GamesFailure(this.errMessage);
}
