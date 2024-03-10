import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/color/colors.dart';
import '../../core/util/strings.dart';
import '../../navigation/app_router.gr.dart';

class NavigationBarItem {
  const NavigationBarItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  final Widget icon;
  final String label;
  final PageRouteInfo<dynamic> route;
}

class NavigationBarUtils {
  static List<NavigationBarItem> navigationBarItems = <NavigationBarItem>[
    NavigationBarItem(
      label: home,
      icon: const Icon(
        Icons.home,
        color: secondaryColor,
      ),
      route: const HomeScreenRoute(),
    ),
    NavigationBarItem(
      label: services,
      icon: const Icon(
        Icons.work,
        color: secondaryColor,
      ),
      route: const ServicesScreenRoute(),
    ),
    NavigationBarItem(
      label: about,
      icon: const Icon(
        Icons.info,
        color: secondaryColor,
      ),
      route: const AboutScreenRoute(),
    ),
    NavigationBarItem(
      label: contact,
      icon: const Icon(
        Icons.contact_page,
        color: secondaryColor,
      ),
      route: const ContactScreenRoute(),
    ),
  ];
}
