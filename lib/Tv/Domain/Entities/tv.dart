// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TV extends Equatable {
  final String name;
  final String overview;
  final int id;
  final String backdropPath;

  const TV({
    required this.name,
    required this.overview,
    required this.id,
    required this.backdropPath,
  });

  @override
  List<Object> get props => [
        name,
        overview,
        id,
        backdropPath,
      ];
}
