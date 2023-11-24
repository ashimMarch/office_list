import 'package:bank_genie_task/core/errors/exceptions.dart';
import 'package:bank_genie_task/core/errors/failures.dart';
import 'package:bank_genie_task/data/office/data_source/office_remote_src.dart';
import 'package:bank_genie_task/domain/office/entity/office_data.dart';
import 'package:bank_genie_task/domain/office/repository/office_repo.dart';
import 'package:dartz/dartz.dart';

class OfficeRepoImple implements OfficeRepo {
  const OfficeRepoImple(this._remote);

  final OfficeRemoteDataSrc _remote;
  @override
  Future<Either<Failure, Iterable<OfficeData>>> getOfficeList() async {
    try {
      final officeData = await _remote.getOfficeList();
      return Right(officeData); 
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

}
