import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';
import 'shared_routes.dart';

@RoutePage(name: 'ContactRoute')
class ContactRouter extends AutoRouter {
  const ContactRouter({super.key});

  static AutoRoute router = AutoRoute(
    path: '',
    page: ContactRoute.page,
    children: _contactRoutes,
  );

  static final List<AutoRoute> _contactRoutes = <AutoRoute>[
    AutoRoute(
      path: 'contact',
      page: ContactRoute.page,
    ),
    ...SharedRoutes.allRoutes,
  ];
}
