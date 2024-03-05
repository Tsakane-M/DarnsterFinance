import 'package:flutter/material.dart';

import '../../../core/animations/entrance_fader.dart';
import '../../../core/color/colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../dimensions/dimensions.dart';

class NavigationBarActionButton extends StatefulWidget {
  const NavigationBarActionButton({
    Key? key,
    required this.label,
    required this.index,
  }) : super(key: key);
  final String label;
  final int index;

  @override
  State<NavigationBarActionButton> createState() => _NavBarActionButtonState();
}

class _NavBarActionButtonState extends State<NavigationBarActionButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const double entranceFaderStart = 0;
    const double entranceFaderEnd = -10;
    const int entranceFaderDuration = 1000;
    return EntranceFader(
      offset: const Offset(
        entranceFaderStart,
        entranceFaderEnd,
      ),
      delay: const Duration(milliseconds: entranceFaderDuration),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: InkWell(
          onHover: (bool value) {
            setState(() => isHover = value);
          },
          onTap: () {
            //scrollProvider.jumpTo(widget.index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingMedium,
              vertical: Dimensions.mediumHalved,
            ),
            child: Text(
              widget.label,
              style: TextStyle(
                color: isHover ? primaryColor : theme.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
