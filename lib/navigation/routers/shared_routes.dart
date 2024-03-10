import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';

class SharedRoutes {
  SharedRoutes._();

  static List<AutoRoute> allRoutes = <AutoRoute>[
    contactRoute,
    aboutRoute,
    servicesRoute,
  ];

  static AutoRoute contactRoute = AutoRoute(
    path: 'contact',
    page: ContactScreenRoute.page,
  );

  static AutoRoute aboutRoute = AutoRoute(
    path: 'about',
    page: AboutScreenRoute.page,
  );

  static AutoRoute servicesRoute = AutoRoute(
    path: 'services',
    page: ServicesScreenRoute.page,
  );

  static AutoRoute homeRoute = AutoRoute(
    path: '',
    page: MainScreenRoute.page,
  );
}
