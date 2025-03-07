import 'package:games/games/domain/entities/game_details/game_details.dart';
import 'package:games/games/domain/entities/game_details/minimum_system_requirements.dart';
import 'package:games/games/domain/entities/game_details/screenshot.dart';

class GameDetialsModel extends GameDetails {
  const GameDetialsModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.status,
    required super.shortDescription,
    required super.description,
    required super.gameUrl,
    required super.genre,
    required super.platform,
    required super.publisher,
    required super.developer,
    required super.releaseDate,
    required super.freetogameProfileUrl,
    super.minimumSystemRequirements,
    super.screenshots,
  });

  factory GameDetialsModel.fromJson(Map<String, dynamic> json) =>
      GameDetialsModel(
        id: json['id'] as int? ?? 0, // Default if null
        title: json['title'] as String? ?? 'Unknown Title',
        thumbnail: json['thumbnail'] as String? ?? '',
        status: json['status'] as String? ?? 'Unknown',
        shortDescription: json['short_description'] as String? ?? '',
        description: json['description'] as String? ?? '',
        gameUrl: json['game_url'] as String? ?? '',
        genre: json['genre'] as String? ?? 'Unknown',
        platform: json['platform'] as String? ?? 'Unknown',
        publisher: json['publisher'] as String? ?? 'Unknown',
        developer: json['developer'] as String? ?? 'Unknown',
        releaseDate: json['release_date'] as String? ?? 'Unknown',
        freetogameProfileUrl: json['freetogame_profile_url'] as String? ?? '',
        minimumSystemRequirements: json['minimum_system_requirements'] == null
            ? null
            : MinimumSystemRequirements.fromJson(
                json['minimum_system_requirements'] as Map<String, dynamic>),
        screenshots: (json['screenshots'] as List<dynamic>?)
            ?.map((e) => Screenshot.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'thumbnail': thumbnail,
        'status': status,
        'short_description': shortDescription,
        'description': description,
        'game_url': gameUrl,
        'genre': genre,
        'platform': platform,
        'publisher': publisher,
        'developer': developer,
        'release_date': releaseDate,
        'freetogame_profile_url': freetogameProfileUrl,
        'minimum_system_requirements': minimumSystemRequirements?.toJson(),
        'screenshots': screenshots?.map((e) => e.toJson()).toList(),
      };
}
