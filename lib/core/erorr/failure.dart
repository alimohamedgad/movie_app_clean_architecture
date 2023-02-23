// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String messege;

  const Failure(this.messege);

  @override
  List<Object> get props => [messege];
}

class ServerFailure extends Failure {
  const ServerFailure(super.messege);
}

class DataBaseFailure extends Failure {
  const DataBaseFailure(super.messege);
}
