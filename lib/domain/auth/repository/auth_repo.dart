import 'package:bank_genie_task/core/errors/failures.dart';
import 'package:bank_genie_task/domain/auth/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRrpo {
  const AuthRrpo();
  Future<Either<Failure, UserData>> signIn({
    required String username,
    required String password,
  });

  Future<Either<Failure, void>> signOut();
}
