import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';
import 'shared_routes.dart';

@RoutePage(name: 'HomeRoute')
class HomeRouter extends AutoRouter {
  const HomeRouter({super.key});

  static AutoRoute router = AutoRoute(
    path: '',
    page: HomeRoute.page,
    children: _homeRoutes,
  );

  static final List<AutoRoute> _homeRoutes = <AutoRoute>[
    AutoRoute(
      path: 'home',
      page: HomeRoute.page,
    ),
    ...SharedRoutes.allRoutes,
  ];
}
