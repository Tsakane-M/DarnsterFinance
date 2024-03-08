import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';
import 'shared_routes.dart';

@RoutePage(name: 'AboutRoute')
class AboutRouter extends AutoRouter {
  const AboutRouter({super.key});

  static AutoRoute router = AutoRoute(
    path: '',
    page: AboutRoute.page,
    children: _aboutRoutes,
  );

  static final List<AutoRoute> _aboutRoutes = <AutoRoute>[
    AutoRoute(
      path: 'about',
      page: AboutRoute.page,
    ),
    ...SharedRoutes.allRoutes,
  ];
}
