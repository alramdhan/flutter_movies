import 'package:flutter/material.dart';

class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => navigatorKey.currentState!;
  BuildContext get mContext => navigatorKey.currentContext!;

  Future<T?> navigateTo<T>(Widget page) {
    return _navigator.push<T>(
      MaterialPageRoute(builder: (_) => page)
    );
  }

  Future<T?> navigateToNamed<T>(String routeName, {Object? arguments}) {
    return _navigator.pushNamed(
      routeName,
      arguments: arguments
    );
  }

  void goBack<T>([T? results]) {
    return _navigator.pop(results);
  }
}