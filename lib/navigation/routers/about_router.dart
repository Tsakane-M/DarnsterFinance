import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';
import 'shared_routes.dart';

@RoutePage(name: 'AboutRouter')
class AboutRouterConfig extends AutoRouter {
  const AboutRouterConfig({super.key});

  static AutoRoute router = AutoRoute(
    path: 'about',
    page: AboutRouter.page,
    children: _aboutRoutes,
  );

  static final List<AutoRoute> _aboutRoutes = <AutoRoute>[
    AutoRoute(
      path: '',
      page: AboutScreenRoute.page,
    ),
  ];
}
