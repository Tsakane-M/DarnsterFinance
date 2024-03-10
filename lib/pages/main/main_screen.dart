import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/configs/app.dart';
import '../../core/responsive/responsive.dart';

import '../../dimensions/dimensions.dart';
import '../../navigation/app_router.gr.dart';

import 'widgets/desktop_navigation_bar.dart';

// part 'widgets/_mobile_drawer.dart';
// part 'widgets/_body.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);

    return AutoTabsScaffold(
      appBarBuilder: (BuildContext context, TabsRouter router) => PreferredSize(
        preferredSize: const Size.fromHeight(Dimensions.extraExtraLarge),
        child: Responsive(
          desktop: DesktopNavigationBar(tabsRouter: router),
          mobile: DesktopNavigationBar(tabsRouter: router),
          tablet: DesktopNavigationBar(tabsRouter: router),
        ),
      ),
      drawer: !Responsive.isDesktop(context) ? Container() : null,
      routes: const <PageRouteInfo<dynamic>>[
        HomeScreenRoute(),
        ServicesScreenRoute(),
        AboutScreenRoute(),
        ContactScreenRoute(),
      ],
      transitionBuilder: (
        BuildContext context,
        Widget child,
        Animation<double> animation,
      ) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
