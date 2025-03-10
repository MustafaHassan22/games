import 'package:equatable/equatable.dart';

class MinimumSystemRequirements extends Equatable {
  final String os;
  final String processor;
  final String memory;
  final String graphics;
  final String storage;

  const MinimumSystemRequirements({
    required this.os,
    required this.processor,
    required this.memory,
    required this.graphics,
    required this.storage,
  });

  factory MinimumSystemRequirements.fromJson(Map<String, dynamic> json) {
    return MinimumSystemRequirements(
      os: json['os'] as String,
      processor: json['processor'] as String,
      memory: json['memory'] as String,
      graphics: json['graphics'] as String,
      storage: json['storage'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'os': os,
        'processor': processor,
        'memory': memory,
        'graphics': graphics,
        'storage': storage,
      };

  @override
  List<Object?> get props => [os, processor, memory, graphics, storage];
}
