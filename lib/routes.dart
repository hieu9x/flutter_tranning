import 'package:flutter/material.dart';
import 'package:flutter_trainning/screens/account/account_screen.dart';
import 'package:flutter_trainning/screens/browser/browser_screen.dart';
import 'screens/screens.dart';

enum Routes { splash, home,browser,account,screens }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String browser='/browser';
  static const String account='/account';
  static const String screens='/screens';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.browser: _Paths.browser,
    Routes.account: _Paths.account,
    Routes.screens:_Paths.screens,
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
      case _Paths.browser:
        return MaterialPageRoute(builder: (_) => BrowserScreen());
      case _Paths.account:
        return MaterialPageRoute(builder: (_) => AccountScreen());
      case _Paths.screens:
        return MaterialPageRoute(builder: (_) => Screens());
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
