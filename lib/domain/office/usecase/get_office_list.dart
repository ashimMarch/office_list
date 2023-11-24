import 'package:bank_genie_task/core/errors/failures.dart';
import 'package:bank_genie_task/domain/office/entity/office_data.dart';
import 'package:bank_genie_task/domain/office/repository/office_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllOffices {
  const GetAllOffices(this._repo);

  final OfficeRepo _repo;

  Future<Either<Failure, Iterable<OfficeData>>> call() => _repo.getOfficeList();

}
