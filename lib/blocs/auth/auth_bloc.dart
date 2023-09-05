import 'package:bloc/bloc.dart';
import 'package:code_union_test/controllers/httpController.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/User/User.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoadEvent>(_onLoadUser);
    on<LoadingEvent>(_onLoadingUser);
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogoutUser);
  }

  void _onLoadingUser(LoadingEvent event, Emitter<AuthState> emit) {
    emit(AuthInitial());
  }

  void _onLoadUser(LoadEvent event, Emitter<AuthState> emit) {
    emit(AuthLoaded(event.user, event.isAuth));
  }

  void _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    HttpController _httpController = HttpController();
    try {
      final responce =
          await _httpController.onLogin(event.login, event.password);
      if (responce is Map<String, dynamic>) {
        String token = responce['tokens']['accessToken'];
        User user = User.fromJson(responce['user']);

        Box<User> getUser() => Hive.box<User>('user');
        getUser().put('1', user);

        emit(AuthenticatedState(token));
        emit(AuthLoaded(user, true));
      } else {
        emit(UnAuthState(responce));
      }
    } catch (e) {
      emit(UnAuthState("Возникла ошибка при авторизации"));
    }
  }

  void _onLogoutUser(LogoutEvent event, Emitter<AuthState> emit) {
    Box<User> getUser() => Hive.box<User>('user');
    getUser().delete('1');
    emit(UnAuthState(""));
  }
}
