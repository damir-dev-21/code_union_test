// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AuthScreen(key: args.key),
      );
    },
    MapRoute.name: (routeData) {
      final args =
          routeData.argsAs<MapRouteArgs>(orElse: () => const MapRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MapScreen(key: args.key),
      );
    },
    MarksRoute.name: (routeData) {
      final args = routeData.argsAs<MarksRouteArgs>(
          orElse: () => const MarksRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: MarksScreen(key: args.key),
      );
    },
    NewsRoute.name: (routeData) {
      final args =
          routeData.argsAs<NewsRouteArgs>(orElse: () => const NewsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: NewsScreen(key: args.key),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/main-screen',
        ),
        RouteConfig(
          AuthRoute.name,
          path: '/',
        ),
        RouteConfig(
          MapRoute.name,
          path: '/map-screen',
        ),
        RouteConfig(
          MarksRoute.name,
          path: '/marks-screen',
        ),
        RouteConfig(
          NewsRoute.name,
          path: '/news-screen',
        ),
      ];
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '/main-screen',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [AuthScreen]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({Key? key})
      : super(
          AuthRoute.name,
          path: '/',
          args: AuthRouteArgs(key: key),
        );

  static const String name = 'AuthRoute';
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MapScreen]
class MapRoute extends PageRouteInfo<MapRouteArgs> {
  MapRoute({Key? key})
      : super(
          MapRoute.name,
          path: '/map-screen',
          args: MapRouteArgs(key: key),
        );

  static const String name = 'MapRoute';
}

class MapRouteArgs {
  const MapRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MapRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MarksScreen]
class MarksRoute extends PageRouteInfo<MarksRouteArgs> {
  MarksRoute({Key? key})
      : super(
          MarksRoute.name,
          path: '/marks-screen',
          args: MarksRouteArgs(key: key),
        );

  static const String name = 'MarksRoute';
}

class MarksRouteArgs {
  const MarksRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MarksRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NewsScreen]
class NewsRoute extends PageRouteInfo<NewsRouteArgs> {
  NewsRoute({Key? key})
      : super(
          NewsRoute.name,
          path: '/news-screen',
          args: NewsRouteArgs(key: key),
        );

  static const String name = 'NewsRoute';
}

class NewsRouteArgs {
  const NewsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'NewsRouteArgs{key: $key}';
  }
}
