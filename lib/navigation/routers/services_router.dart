import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';
import 'shared_routes.dart';

@RoutePage(name: 'ServicesRoute')
class ServicesRouter extends AutoRouter {
  const ServicesRouter({super.key});

  static AutoRoute router = AutoRoute(
    path: 'services',
    page: ServicesRoute.page,
    children: _servicesRoutes,
  );

  static final List<AutoRoute> _servicesRoutes = <AutoRoute>[
    AutoRoute(
      path: '',
      page: ServicesRoute.page,
    ),
    ...SharedRoutes.allRoutes,
  ];
}
