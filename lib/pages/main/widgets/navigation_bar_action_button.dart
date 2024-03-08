import 'package:flutter/material.dart';

import '../../../app/utils/navigationbar_utils.dart';
import '../../../core/animations/entrance_fader.dart';
import '../../../core/color/colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../dimensions/dimensions.dart';

class NavigationBarActionButton extends StatefulWidget {
  const NavigationBarActionButton({
    Key? key, // Fix the typo here
    required this.navigationBarItem,
    required this.onTap,
    required this.active,
  }) : super(key: key); // Fix the typo here

  final NavigationBarItem navigationBarItem;
  final void Function()? onTap;
  final bool active;

  @override
  State<NavigationBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavigationBarActionButton> {
  bool isHover = false;
  NavigationBarItem get navigationBarItem => widget.navigationBarItem;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return EntranceFader(
      offset: const Offset(
        0,
        -10,
      ),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: InkWell(
          onHover: (bool value) {
            setState(() => isHover = value);
          },
          onTap: widget.onTap, // Use the onTap from the widget
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingMedium,
              vertical: Dimensions.mediumHalved,
            ),
            child: Text(
              navigationBarItem.label,
              style: TextStyle(
                color: widget.active
                    ? primaryColor
                    : (isHover ? primaryColor : theme.textColor),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
