import 'package:equatable/equatable.dart';

class Screenshot extends Equatable {
  final int id;
  final String image;

  const Screenshot({required this.id, required this.image});

  factory Screenshot.fromJson(Map<String, dynamic> json) => Screenshot(
        id: json['id'] as int,
        image: json['image'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
      };

  @override
  List<Object?> get props => [id, image];
}
