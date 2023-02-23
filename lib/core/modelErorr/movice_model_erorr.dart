import 'package:equatable/equatable.dart';

class ErrorMessgeMode extends Equatable {
  final bool sucess;
  final int statusCode;
  final String massege;

  const ErrorMessgeMode({
    required this.sucess,
    required this.statusCode,
    required this.massege,
  });

  factory ErrorMessgeMode.fromJson(Map<String, dynamic> json) =>
      ErrorMessgeMode(
        sucess: json['success'],
        statusCode: json['status_code'],
        massege: json['status_message'],
      );

  @override
  List<Object?> get props => [
        sucess,
        statusCode,
        massege,
      ];
}
