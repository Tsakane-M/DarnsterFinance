import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'navigation/app_router.dart';
import 'navigation/global_app_router.dart';
import 'pages/home/home_page.dart';

class DarnsterFinance extends StatefulWidget {
  const DarnsterFinance({Key? key}) : super(key: key);

  @override
  State<DarnsterFinance> createState() => _DarnsterFinanceState();
}

class _DarnsterFinanceState extends State<DarnsterFinance>
    with WidgetsBindingObserver {
  _DarnsterFinanceState() : appRouter = AppRouter() {
    final GlobalAppRouter globalRouterUtil = GlobalAppRouter();
    globalRouterUtil.appRouter = appRouter;
  }

  final AppRouter appRouter;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return Sizer(
          builder: (BuildContext context, Orientation orientation,
              DeviceType deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Darnster Finance',
              theme: AppTheme.themeData(state.isDarkThemeOn, context),
              home: const HomePage(),
            );
          },
        );
      },
    );
  }
}
