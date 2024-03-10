import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';

@RoutePage(name: 'ContactRouter')
class ContactRouterConfig extends AutoRouter {
  const ContactRouterConfig({super.key});

  static AutoRoute router = AutoRoute(
    path: 'contact',
    page: ContactRouter.page,
    children: _contactRoutes,
  );

  static final List<AutoRoute> _contactRoutes = <AutoRoute>[
    AutoRoute(
      path: '',
      page: ContactScreenRoute.page,
    ),
  ];
}
