import 'package:auto_route/auto_route.dart';

import '../app_router.gr.dart';

@RoutePage(name: 'ServicesRouter')
class ServicesRouterConfig extends AutoRouter {
  const ServicesRouterConfig({super.key});

  static AutoRoute router = AutoRoute(
    path: 'services',
    page: ServicesRouter.page,
    children: _servicesRoutes,
    maintainState: false,
  );

  static final List<AutoRoute> _servicesRoutes = <AutoRoute>[
    AutoRoute(
      path: '',
      page: ServicesScreenRoute.page,
    ),
    AutoRoute(
      path: 'ecocash',
      page: EcocashScreenRoute.page,
    ),
    AutoRoute(
      path: 'asset_based_loans',
      page: AssetBasedLoansScreenRoute.page,
    ),
    AutoRoute(
      path: 'business_loans',
      page: BusinessLoansScreenRoute.page,
    ),
    AutoRoute(
      path: 'personal_loans',
      page: PersonalLoansScreenRoute.page,
    ),
  ];
}
