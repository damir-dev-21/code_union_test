import 'package:code_union_test/blocs/auth/auth_bloc.dart';
import 'package:code_union_test/controllers/userController.dart';
import 'package:code_union_test/models/User/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'routes/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация hive
  await Hive.initFlutter();
  // Регистрация пользовательского адаптера для бд Hive
  Hive.registerAdapter(UserAdapter());
  // Открыть структуру бд по ключю user
  await Hive.openBox<User>('user');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  final _appRouter = AppRouter();
  User? user;

  @override
  void initState() {
    super.initState();
    // Получение пользователя из бд
    user = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()
        ..add(user != null ? LoadEvent(user, true) : LoadingEvent()),
      child: GetCupertinoApp.router(
        debugShowCheckedModeBanner: false,
        key: navigatorKey,
        title: 'Code Union',
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
