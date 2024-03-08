import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../app/utils/navigationbar_utils.dart';
import '../../app_icons.dart';
import '../../core/color/colors.dart';
import '../../core/configs/app.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/cubit/theme_cubit.dart';

import '../../dimensions/dimensions.dart';
import '../../navigation/app_router.gr.dart';
import '../about/about_page.dart';
import '../contact/contact_page.dart';
import '../home/home_page.dart';
import '../services/services_page.dart';
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
    final double height = MediaQuery.of(context).size.height;

    return AutoTabsRouter(
      routes: const <PageRouteInfo<dynamic>>[
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
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Responsive(
              desktop: _DesktopNavigationBar(tabsRouter: tabsRouter),
              mobile: const HomeScreen(),
              tablet: const HomeScreen(),
            ),
          ),
          drawer: !Responsive.isDesktop(context) ? Container() : null,
          body: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (BuildContext context, ThemeState state) {
              return IndexedStack(
                index: tabsRouter.activeIndex,
                children: const [
                  HomeScreen(),
                  ServicesScreen(),
                  AboutScreen(),
                  ContactScreen(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
