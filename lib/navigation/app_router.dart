import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';
import 'routers/main_router.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,ScreenRoute')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        MainRouterConfig.router,
      ];
}
