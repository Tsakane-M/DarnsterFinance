import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';
import 'shared_routes.dart';

@RoutePage(name: 'ServicesRouter')
class ServicesRouterConfig extends AutoRouter {
  const ServicesRouterConfig({super.key});

  static AutoRoute router = AutoRoute(
    path: 'services',
    page: ServicesRouter.page,
    children: _servicesRoutes,
  );

  static final List<AutoRoute> _servicesRoutes = <AutoRoute>[
    AutoRoute(
      path: '',
      page: ServicesScreenRoute.page,
    ),
    SharedRoutes.aboutRoute,
    SharedRoutes.contactRoute,
    SharedRoutes.homeRoute,
  ];
}
