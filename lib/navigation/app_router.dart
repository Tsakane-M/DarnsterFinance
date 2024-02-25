import 'package:auto_route/auto_route.dart';


@AutoRouterConfig(replaceInRouteName: 'Page,Route,Screen')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => <AutoRoute>[];
}
