import 'dart:async';
import 'package:bank_genie_task/domain/auth/entity/user_entity.dart';
import 'package:bank_genie_task/domain/auth/usecase/sign_in.dart';
import 'package:bank_genie_task/domain/auth/usecase/sign_out.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignInUserUsecase signInUser,
    required SignOutUserUsecase signOutUser,
  }) : 
    _signInUser = signInUser,
    _signOutUser = signOutUser,
  super(const AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(const AuthInitial()),);
    on<SignInUser>(_signInUserEvent);
    on<SignOutUser>(_signOutUserEvent);

  }
  final SignInUserUsecase _signInUser;
  final SignOutUserUsecase _signOutUser;

  UserData? _user;
  UserData? get user => _user;



  FutureOr<void> _signInUserEvent(
    SignInUser event, Emitter<AuthState> emit
  ) async{
    emit(const AuthLoading());
    final result = await _signInUser(
      username: event.userName,
      password: event.password,
    );
    result.fold(
      (failure) {
        emit(AuthError(failure.errorMessage));
      }, 
      (data) {
        _user = data;
        emit(const UserLogedIn());
      }
    );
  }

  FutureOr<void> _signOutUserEvent(
    SignOutUser event, Emitter<AuthState> emit
  ) async{
    emit(const AuthLoading());
    final result = await _signOutUser();
    result.fold(
      (failure) {
        _user = null;
        emit(const UserSignedOut());
      }, 
      (data) {
        _user = null;
        emit(const UserSignedOut());
      }
    );
  }
}
