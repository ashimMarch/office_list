import 'package:bank_genie_task/core/errors/failures.dart';
import 'package:bank_genie_task/domain/office/entity/office_data.dart';
import 'package:dartz/dartz.dart';

abstract class OfficeRepo {
  const OfficeRepo();

  Future<Either<Failure, Iterable<OfficeData>>> getOfficeList();
}
