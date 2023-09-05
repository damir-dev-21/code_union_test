part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoadingEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  String login;
  String password;

  LoginEvent(this.login, this.password);
}

class LoadEvent extends AuthEvent {
  final User? user;
  bool isAuth;

  LoadEvent(this.user, this.isAuth);

  @override
  List<Object> get props => [user!, isAuth];
}

class LogoutEvent extends AuthEvent {}
