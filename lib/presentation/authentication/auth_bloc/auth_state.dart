part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class UserLogedIn extends AuthState {
  const UserLogedIn();
}

final class UserSignedOut extends AuthState {
  const UserSignedOut();
}

final class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;
}
