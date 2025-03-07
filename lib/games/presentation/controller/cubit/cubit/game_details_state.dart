part of 'game_details_cubit.dart';

sealed class GameDetailsState extends Equatable {
  const GameDetailsState();

  @override
  List<Object> get props => [];
}

final class GameDetailsInitial extends GameDetailsState {}

final class GameDetailsLoading extends GameDetailsState {}

final class GameDetailsSuccess extends GameDetailsState {
  final GameDetails gameDetails;

  const GameDetailsSuccess(this.gameDetails);
}

final class GameDetailsFailure extends GameDetailsState {
  final String errMessage;

  const GameDetailsFailure({required this.errMessage});
}
