import 'package:games/games/domain/entities/game/game.dart';

class GameModel extends Game {
  const GameModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.shortDescription,
    required super.gameUrl,
    required super.genre,
    required super.platform,
    required super.publisher,
    required super.developer,
    required super.releaseDate,
    required super.freetogameProfileUrl,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: json['id'] as int,
        title: json['title'] as String,
        thumbnail: json['thumbnail'] as String,
        shortDescription: json['short_description'] as String,
        gameUrl: json['game_url'] as String,
        genre: json['genre'] as String,
        platform: json['platform'] as String,
        publisher: json['publisher'] as String,
        developer: json['developer'] as String,
        releaseDate: json['release_date'] as String,
        freetogameProfileUrl: json['freetogame_profile_url'] as String,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'thumbnail': thumbnail,
        'short_description': shortDescription,
        'game_url': gameUrl,
        'genre': genre,
        'platform': platform,
        'publisher': publisher,
        'developer': developer,
        'release_date': releaseDate,
        'freetogame_profile_url': freetogameProfileUrl,
      };
}
