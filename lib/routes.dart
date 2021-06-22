import 'package:flutter/material.dart';

import 'screens/screens.dart';

enum Routes { splash, home }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
  };

  static String of(Routes route) => _pathMap[route];
}

class AppNavigator {
  AppNavigator._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case _Paths.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }

  static Future push<T>(Routes route, [T arguments]) =>
      state.pushNamed(_Paths.of(route), arguments: arguments);

  static Future replaceWith<T>(Routes route, [T arguments]) =>
      state.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop<T>([T result]) => state.pop(result);

  static NavigatorState get state => navigatorKey.currentState;
}
