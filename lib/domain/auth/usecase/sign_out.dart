import 'package:bank_genie_task/core/errors/failures.dart';
import 'package:bank_genie_task/domain/auth/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignOutUserUsecase {
  const SignOutUserUsecase(this._repo);

  final AuthRrpo _repo;

  Future<Either<Failure, void>> call() => _repo.signOut(); 
}
