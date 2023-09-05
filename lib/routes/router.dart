import 'package:auto_route/auto_route.dart';
import 'package:code_union_test/screens/AuthScreen.dart';
import 'package:code_union_test/screens/MapScreen.dart';
import 'package:code_union_test/screens/MarksScreen.dart';
import 'package:code_union_test/screens/NewsScreen.dart';
import 'package:code_union_test/screens/MainScreen.dart';

import 'package:flutter/cupertino.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthScreen, initial: true),
    AutoRoute(page: MainScreen),
    AutoRoute(page: MapScreen),
    AutoRoute(page: MarksScreen),
    AutoRoute(page: NewsScreen),
  ],
)
class AppRouter extends _$AppRouter {}
