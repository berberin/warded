import 'package:flutter/material.dart';
import 'package:warded/config/router.dart';

import 'config/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Observer Ward",
      theme: AppTheme(Brightness.light).themeData,
      darkTheme: AppTheme(Brightness.dark).themeData,
      //localizationsDelegates: ,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
