import 'package:bank_genie_task/core/errors/exceptions.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  const Failure({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  String get errorMessage => '$statusCode Error: $message';
  @override
  List<Object?> get props => [message, statusCode];
}


class CacheFailure extends Failure{
  const CacheFailure({required super.message, required super.statusCode});

  factory CacheFailure.fromException(){
    return const CacheFailure(message: 'Something went wrong', statusCode: 400);
  }
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message, required super.statusCode});

  factory ServerFailure.fromException(ServerException exception){
    return ServerFailure(
      message: exception.message, 
      statusCode: exception.statusCode,
    );
  }
}
