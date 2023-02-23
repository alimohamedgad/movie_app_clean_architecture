// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Geners extends Equatable {
  final String name;
  final int id;

  const Geners({
    required this.name,
    required this.id,
  });

  

  @override
  List<Object> get props => [
        name,
        id,
      ];
}
