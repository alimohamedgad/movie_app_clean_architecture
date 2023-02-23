import '../../Domain/Entities/tv.dart';

class TvModel extends TV {
  const TvModel({
    required super.name,
    required super.overview,
    required super.id,
    required super.backdropPath,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        name: json['name'],
        overview: json['overview'],
        id: json['id'],
        backdropPath: json['backdrop_path'] ?? '',
      );
}
