part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class CheckUserIsLoggedIn extends AuthEvent{
  const CheckUserIsLoggedIn();

}

class SignInUser extends AuthEvent{
  const SignInUser({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;
  @override
  List<String> get props => [userName, password];
}

class SignOutUser extends AuthEvent{
  const SignOutUser();
}
