
import 'package:bank_genie_task/domain/office/entity/office_data.dart';
import 'package:bank_genie_task/domain/office/usecase/get_office_list.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'office_state.dart';

class OfficeCubit extends Cubit<OfficeState> {
  OfficeCubit(this._getAllOffices) : super(const OfficeInitial());
  final GetAllOffices _getAllOffices;

  Future<void> getAllOffices() async{
    print(' ======= AAAAAAAAAAAAAA ======= ');
    emit(const OfficeLoading());
    final result = await _getAllOffices();
    result.fold(
      (failure) => emit(OfficeError(failure.errorMessage)), 
      (offices) => emit(OfficeLoaded(offices)),
    );
  }
}
