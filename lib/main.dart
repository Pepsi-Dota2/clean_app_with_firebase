import 'package:auto_route/auto_route.dart';
import 'package:clean_app/core/config/di/config_dependencies.dart';
import 'package:clean_app/routes/routes.dart';
import 'package:clean_app/routes/routes.gr.dart';
import 'package:flutter/material.dart';

void main() async {
  await configDependencies();
  return runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: (_) => const DeepLink([PageRouteInfo(CheckUserRoute.name)]),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
