import 'package:code_union_test/blocs/auth/auth_bloc.dart';
import 'package:code_union_test/config/colors.dart';
import 'package:code_union_test/routes/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthBloc>(context);

    return CupertinoPageScaffold(
      backgroundColor: bgColor,
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        backgroundColor: whiteColor,
        middle: Text("Профиль",
            style: TextStyle(
                color: blackColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w100)),
      ),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoaded) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Image.asset('assets/user.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            state.user!.nickname,
                            style: const TextStyle(
                                fontSize: 22,
                                fontFamily: "Manrope",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          state.user!.email,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Manrope",
                              fontWeight: FontWeight.w100,
                              color: Color.fromARGB(255, 190, 190, 190)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: whiteColor),
                    child: GestureDetector(
                      onTap: () {
                        authenticationBloc.add(LogoutEvent());
                        authenticationBloc.add(LoadingEvent());
                        context.router.replace(AuthRoute());
                      },
                      child: Text(
                        'Выйти',
                        style: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w100,
                            fontSize: 18,
                            color: Color.fromARGB(181, 255, 0, 0)),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
