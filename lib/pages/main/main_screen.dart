import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../app/utils/navigationbar_utils.dart';
import '../../core/configs/app.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/cubit/theme_cubit.dart';

import '../../dimensions/dimensions.dart';
import '../../navigation/app_router.gr.dart';
import '../about/about_screen.dart';
import '../contact/contact_screen.dart';
import '../home/home_screen.dart';
import '../services/services_screen.dart';
import 'widgets/navigation_bar_action_button.dart';
import 'widgets/navigation_bar_logo.dart';
part 'widgets/_desktop_navigation_bar.dart';
// part 'widgets/_mobile_drawer.dart';
// part 'widgets/_body.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);

    return AutoTabsRouter(
      routes: <PageRouteInfo<dynamic>>[
        HomeRoute(),
        ServicesRoute(),
        AboutRoute(),
        ContactRoute(),
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
      builder: (
        BuildContext context,
        Widget child,
      ) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          extendBodyBehindAppBar: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Responsive(
              desktop: _DesktopNavigationBar(tabsRouter: tabsRouter),
              mobile: HomeScreen(),
              tablet: HomeScreen(),
            ),
          ),
          drawer: !Responsive.isDesktop(context) ? Container() : null,
          body: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (BuildContext context, ThemeState state) {
              return IndexedStack(
                index: tabsRouter.activeIndex,
                children: <Widget>[
                  HomeScreen(),
                  const ServicesScreen(),
                  const AboutScreen(),
                  const ContactScreen(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
