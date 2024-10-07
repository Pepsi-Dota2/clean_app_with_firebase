import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CheckUserRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ];
}
