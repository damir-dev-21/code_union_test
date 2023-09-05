part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final String token;

  AuthenticatedState(this.token);
}

class UnAuthState extends AuthState {
  final String message;

  UnAuthState(this.message);
}

class AuthLoaded extends AuthState {
  final User? user;
  bool isAuth;

  AuthLoaded(this.user, this.isAuth);

  @override
  List<Object> get props => [user!, isAuth];
}
