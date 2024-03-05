import 'package:flutter/material.dart';

import '../../../core/animations/entrance_fader.dart';
import '../../../core/color/colors.dart';
import '../../../core/theme/app_theme.dart';

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
    return EntranceFader(
      offset: const Offset(0, -10),
      delay: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 250),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          gradient: isHover ? redBlue : null,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: InkWell(
          onHover: (bool value) {
            setState(() => isHover = value);
          },
          onTap: () {
            //scrollProvider.jumpTo(widget.index);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              widget.label,
              style: TextStyle(
                color: theme.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
