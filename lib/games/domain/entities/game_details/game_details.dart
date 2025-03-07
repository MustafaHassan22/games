import 'package:equatable/equatable.dart';

import 'minimum_system_requirements.dart';
import 'screenshot.dart';

class GameDetails extends Equatable {
  final int id;
  final String title;
  final String thumbnail;
  final String status;
  final String shortDescription;
  final String description;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;
  final MinimumSystemRequirements? minimumSystemRequirements;
  final List<Screenshot>? screenshots;

  const GameDetails({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.status,
    required this.shortDescription,
    required this.description,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
    this.minimumSystemRequirements,
    this.screenshots,
  });

  factory GameDetails.fromJson(Map<String, dynamic> json) => GameDetails(
        id: json['id'] as int,
        title: json['title'] as String,
        thumbnail: json['thumbnail'] as String,
        status: json['status'] as String,
        shortDescription: json['short_description'] as String,
        description: json['description'] as String,
        gameUrl: json['game_url'] as String,
        genre: json['genre'] as String,
        platform: json['platform'] as String,
        publisher: json['publisher'] as String,
        developer: json['developer'] as String,
        releaseDate: json['release_date'] as String,
        freetogameProfileUrl: json['freetogame_profile_url'] as String,
        minimumSystemRequirements: json['minimum_system_requirements'] == null
            ? null
            : MinimumSystemRequirements.fromJson(
                json['minimum_system_requirements'] as Map<String, dynamic>),
        screenshots: (json['screenshots'] as List<dynamic>?)
            ?.map((e) => Screenshot.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

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

  @override
  List<Object?> get props {
    return [
      id,
      title,
      thumbnail,
      status,
      shortDescription,
      description,
      gameUrl,
      genre,
      platform,
      publisher,
      developer,
      releaseDate,
      freetogameProfileUrl,
      minimumSystemRequirements,
      screenshots,
    ];
  }
}
