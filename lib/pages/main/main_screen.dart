import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../app/utils/navbar_utils.dart';
import '../../app/widgets/arrow_on_top.dart';
import '../../app_icons.dart';
import '../../core/color/colors.dart';
import '../../core/configs/app.dart';
import '../../core/responsive/responsive.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/cubit/theme_cubit.dart';

import '../../data/persistence/key_value_storage.dart';
import '../home/home_page.dart';
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

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Responsive(
          desktop: _DesktopNavigationBar(),
          mobile: HomeScreen(),
          tablet: HomeScreen(),
        ),
      ),
      drawer: !Responsive.isDesktop(context) ? Container() : null,
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return Stack(
            children: <Widget>[
              Positioned(
                top: height * 0.2,
                left: -88,
                child: Container(
                  height: height / 3,
                  width: 166,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondaryColor,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -100,
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 500,
                      sigmaY: 500,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              const ArrowOnTop()
            ],
          );
        },
      ),
    );
  }
}
