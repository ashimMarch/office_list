import 'package:bank_genie_task/core/errors/exceptions.dart';
import 'package:bank_genie_task/core/errors/failures.dart';
import 'package:bank_genie_task/data/auth/data_source/remote_src.dart';
import 'package:bank_genie_task/data/auth/model/authentication_data.dart';
import 'package:bank_genie_task/domain/auth/entity/user_entity.dart';
import 'package:bank_genie_task/domain/auth/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRrpoImpl implements AuthRrpo {
  const AuthRrpoImpl(this._remote,);

  final AuthRemoteSrc _remote;

  @override
  Future<Either<Failure, UserData>> signIn({
    required String username, 
    required String password,
  }) async {
    try {
      final user = await _remote.signIn(username: username, password: password);
      return Right(user);
      
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } catch (e){
      return const Left(ServerFailure(
        message: 'Something went wrong',
        statusCode: 505,
      ));
    }
    
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    AuthenticationData.instance.reset();
    return const Right(null);
  }

}
