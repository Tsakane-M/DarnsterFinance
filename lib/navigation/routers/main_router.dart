import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';
import 'about_router.dart';
import 'contact_router.dart';
import 'home_router.dart';
import 'services_router.dart';

@RoutePage(name: 'MainRouter')
class MainRouterConfig extends AutoRouter {
  const MainRouterConfig({super.key});

  static AutoRoute router = AutoRoute(
    path: '/',
    page: MainRouter.page,
    children: _mainRoutes,
  );

  static final List<AutoRoute> _mainRoutes = <AutoRoute>[
    AutoRoute(path: '', page: MainScreenRoute.page, children: <AutoRoute>[
      HomeRouterConfig.router,
      ServicesRouterConfig.router,
      AboutRouterConfig.router,
      ContactRouterConfig.router,
    ]),
  ];
}
