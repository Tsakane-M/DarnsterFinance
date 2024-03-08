part of '../main_screen.dart';

class _DesktopNavigationBar extends StatefulWidget {
  const _DesktopNavigationBar({
    Key? key,
    required this.tabsRouter,
  }) : super(key: key);

  final TabsRouter tabsRouter;

  @override
  State<_DesktopNavigationBar> createState() => _DesktopNavigationBarState();
}

class _DesktopNavigationBarState extends State<_DesktopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final TabsRouter tabsRouter = widget.tabsRouter;

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (BuildContext context, ThemeState state) {
        return Container(
          padding:
              EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDarkMode
                  ? <Color>[Colors.black87, Colors.grey[900]!]
                  : <Color>[const Color(0xFFD3D3D3), const Color(0xFFA9A9A9)],
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: isDarkMode
                    ? Colors.grey[900]!
                    : Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              const NavigationBarLogo(),
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
              InkWell(
                onTap: () {
                  final bool newThemeState = !state.isLightThemeOn;
                  context.read<ThemeCubit>().updateTheme(newThemeState);
                },
                child: Icon(
                  state.isLightThemeOn ? AppIcons.darkMode : AppIcons.lightMode,
                  size: Dimensions.large,
                  color: state.isLightThemeOn ? Colors.black : Colors.white,
                ),
              ),
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
