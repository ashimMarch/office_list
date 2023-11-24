part of 'office_cubit.dart';

sealed class OfficeState extends Equatable {
  const OfficeState();

  @override
  List<Object> get props => [];
}

final class OfficeInitial extends OfficeState {
  const OfficeInitial();
}

final class OfficeLoading extends OfficeState {
  const OfficeLoading();
}

final class OfficeLoaded extends OfficeState {
  const OfficeLoaded(this.offices);
  final Iterable<OfficeData> offices;
    
  @override
  List<Object> get props => [offices];
}

final class OfficeError extends OfficeState {
  const OfficeError(this.message);
  final String message;
  @override
  List<String> get props => [message];
}
