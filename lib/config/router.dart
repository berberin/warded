import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:warded/features/tormentor/presentation/screens/tormentor_screen.dart';

class AppRouter {
  AppRouter._();

  static final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: TormentorScreen.route,
        builder: (context, state) => const TormentorScreen(),
      ),
    ],
    observers: [
      routeObserver,
    ],
    // redirect: (state) {
    //   final loggedIn = authStateListenable.value;
    //   final goingToLogin = state.subloc.contains('/${AuthScreen.route}');
    //
    //   if (!loggedIn && !goingToLogin) {
    //     return '/${AuthScreen.route}';
    //   }
    //   if (loggedIn && goingToLogin) return '/';
    //
    //   return null;
    // },
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => Container(),
  );
}
