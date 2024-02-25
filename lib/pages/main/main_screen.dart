import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../app/widgets/arrow_on_top.dart';
import '../../core/color/colors.dart';
import '../../core/configs/others/app_typography.dart';
import '../../core/configs/others/space.dart';
import '../../core/res/responsive.dart';
import '../../core/theme/cubit/theme_cubit.dart';
import '../home/home_page.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Space.init();
    AppText.init();

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Responsive(
          desktop: HomeScreen(),
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
