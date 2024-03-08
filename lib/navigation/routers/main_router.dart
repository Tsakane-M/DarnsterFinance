import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';
import 'about_router.dart';
import 'contact_router.dart';
import 'home_router.dart';
import 'services_router.dart';

@RoutePage(name: 'MainRoute')
class MainRouter extends AutoRouter {
  const MainRouter({super.key});

  static AutoRoute router = AutoRoute(
    path: '/',
    page: MainRoute.page,
    children: _mainRoutes,
  );

  static final List<AutoRoute> _mainRoutes = <AutoRoute>[
    AutoRoute(path: '', page: MainRoute.page, children: <AutoRoute>[
      HomeRouter.router,
      ServicesRouter.router,
      AboutRouter.router,
      ContactRouter.router,
    ]),
  ];
}
