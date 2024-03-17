import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../app/utils/navigationbar_utils.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/cubit/theme_cubit.dart';
import '../../../dimensions/dimensions.dart';
import '../../../navigation/app_router.gr.dart';
import 'navigation_bar_action_button.dart';
import 'navigation_bar_logo.dart';

class DesktopNavigationBar extends StatefulWidget {
  const DesktopNavigationBar({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  State<DesktopNavigationBar> createState() => _DesktopNavigationBarState();
}

class _DesktopNavigationBarState extends State<DesktopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final TabsRouter tabsRouter = widget.tabsRouter;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return Container(
          padding:
              EdgeInsets.symmetric(horizontal: size.width / 20, vertical: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.white, Colors.white],
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    context.pushRoute(const HomeScreenRoute());
                  },
                  child: const NavigationBarLogo()),
              const Expanded(child: SizedBox(width: double.infinity)),
              ...NavigationBarUtils.navigationBarItems.mapIndexed(
                (int index, NavigationBarItem item) =>
                    NavigationBarActionButton(
                  onTap: () {
                    tabsRouter.setActiveIndex(index);
                  },
                  navigationBarItem: item,
                  active: tabsRouter.activeIndex == index,
                ),
              ),
              const SizedBox(
                width: Dimensions.mediumHalved,
              ),
              //disabling dark mode toggle for now
              // InkWell(
              //   onTap: () {
              //     final bool newThemeState = !state.isLightThemeOn;
              //     context.read<ThemeCubit>().updateTheme(newThemeState);
              //   },

              // child: Icon(
              //   state.isLightThemeOn ? AppIcons.darkMode : AppIcons.lightMode,
              //   size: Dimensions.large,
              //   color: state.isLightThemeOn ? Colors.black : Colors.white,
              // ),
              // ),
            ],
          ),
        );
      },
    );
  }
}

class _NavBarTablet extends StatelessWidget {
  const _NavBarTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final drawerProvider = Provider.of<DrawerProvider>(context);
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.navigationBarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
      child: Row(
        children: <Widget>[
          IconButton(
            highlightColor: Colors.white54,
            onPressed: () {
              //drawerProvider.key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          //Space.xm!,
          const NavigationBarLogo(),
        ],
      ),
    );
  }
}
