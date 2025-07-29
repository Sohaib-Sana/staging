// Necessary imports

import 'package:flutter/material.dart';
import '../../presentation/screens/home_screen.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  static Future<T?> navigateTo<T>(Route<T> route) {
    return navigator!.push(route);
  }

  static Future<T?> navigateToNamed<T>(String routeName, {Object? arguments}) {
    return navigator!.pushNamed(routeName, arguments: arguments);
  }

  static Future<T?> navigateToNamedAndRemoveUntil<T>(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return navigator!.pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  static Future<T?> navigateToAndRemoveUntil<T>(
    Route<T> route,
    bool Function(Route<dynamic>)? predicate,
  ) {
    return navigator!.pushAndRemoveUntil(
      route,
      predicate ?? (_) => false,
    );
  }

  static void goBack<T>([T? result]) {
    return navigator!.pop(result);
  }

  static void popUntil(String routeName) {
    navigator!.popUntil(ModalRoute.withName(routeName));
  }
}

class AppRouter {
  static const String home = '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
