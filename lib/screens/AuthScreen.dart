import 'package:code_union_test/blocs/auth/auth_bloc.dart';
import 'package:code_union_test/config/colors.dart';
import 'package:code_union_test/routes/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String login = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthLoaded) {
            // Навигация на основной экран после успешной авторизации
            context.router.push(const MainRoute());
          }
          if (state is UnAuthState) {
            // Отображение модального окна с содержанием ошибки
            return showCupertinoModalPopup(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text(state.message),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            authenticationBloc.add(LoadingEvent());
                            context.router.pop();
                          },
                          child: const Text("OK"))
                    ],
                  );
                });
          }
        },
        child: CupertinoPageScaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: bgColor,
          navigationBar: const CupertinoNavigationBar(
            backgroundColor: Color(0xFFFFFFFFF),
            automaticallyImplyLeading: false,
            border: Border(),
            middle: Text('Авторизация',
                style: TextStyle(
                    color: blackColor,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w100)),
          ),
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is AuthInitial) {
              // Отображение формы авторизации
              return _buildAuthForm(context, authenticationBloc);
            }
            return Center(child: const CircularProgressIndicator());
          }),
        ));
  }

  _buildAuthForm(BuildContext context, AuthBloc authenticationBloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 30),
          decoration: const BoxDecoration(color: whiteColor),
          child: Column(
            children: [
              SizedBox(
                child: CupertinoTextField(
                  keyboardType: TextInputType.text,
                  key: const ValueKey('login'),
                  onChanged: (e) {
                    setState(() {
                      login = e;
                    });
                  },
                  decoration: const BoxDecoration(border: Border()),
                  placeholder: 'Логин или почта',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  placeholderStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.w100),
                  cursorColor: Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
              ),
              const Divider(
                height: 5,
                thickness: 1,
              ),
              SizedBox(
                child: CupertinoTextField(
                  keyboardType: TextInputType.text,
                  key: const ValueKey('password'),
                  onChanged: (text) => {
                    setState(() {
                      password = text;
                    })
                  },
                  cursorColor: Colors.grey,
                  placeholder: "Пароль",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  placeholderStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: "Manrope",
                      fontWeight: FontWeight.w100),
                  decoration: const BoxDecoration(border: Border()),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 35,
              height: 64,
              child: CupertinoButton(
                  color: mainColor,
                  child: const Text(
                    "Войти",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (login.isNotEmpty && password.isNotEmpty) {
                      authenticationBloc.add(LoginEvent(login, password));
                    } else {
                      return showCupertinoModalPopup(
                          context: context,
                          builder: (context) => const CupertinoAlertDialog(
                                title: Text('Заполните все поля!'),
                              ));
                    }
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 35,
              height: 64,
              child: CupertinoButton(
                  color: mainColor,
                  child: const Text(
                    "Зарегистрироваться",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {}),
            ),
          ],
        )
      ],
    );
  }
}
