import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';

class SharedRoutes {
  SharedRoutes._();

  static List<AutoRoute> allRoutes = <AutoRoute>[
    homeRoute,
    contactRoute,
    aboutRoute,
    servicesRoute,
  ];

  static AutoRoute homeRoute = CustomRoute(
    path: 'home',
    page: HomeRoute.page,
    transitionsBuilder: TransitionsBuilders.fadeIn,
  );

  static AutoRoute contactRoute = AutoRoute(
    path: 'contact',
    page: ContactRoute.page,
  );

  static AutoRoute aboutRoute = AutoRoute(
    path: 'about',
    page: AboutRoute.page,
  );

  static AutoRoute servicesRoute = AutoRoute(
    path: 'services',
    page: ServicesRoute.page,
  );
}
