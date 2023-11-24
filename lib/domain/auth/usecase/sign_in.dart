import 'package:bank_genie_task/core/errors/failures.dart';
import 'package:bank_genie_task/domain/auth/entity/user_entity.dart';
import 'package:bank_genie_task/domain/auth/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignInUserUsecase {
  const SignInUserUsecase(this._repo);

  final AuthRrpo _repo;

  Future<Either<Failure, UserData>> call({
    required String username,
    required String password,
  }) => _repo.signIn(username: username, password: password); 
}
