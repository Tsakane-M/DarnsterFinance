import 'package:auto_route/auto_route.dart';
import '../app_router.gr.dart';

@RoutePage(name: 'HomeRouter')
class HomeRouterConfig extends AutoRouter {
  const HomeRouterConfig({super.key});

  static AutoRoute router = AutoRoute(
    path: 'home',
    page: HomeRouter.page,
    children: _homeRoutes,
  );

  static final List<AutoRoute> _homeRoutes = <AutoRoute>[
    AutoRoute(
      path: '',
      page: HomeScreenRoute.page,
    ),
  ];
}
