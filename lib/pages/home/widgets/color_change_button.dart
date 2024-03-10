import 'package:flutter/material.dart';

import '../../../core/responsive/responsive.dart';
import '../../../core/theme/app_theme.dart';

class ColorChangeButton extends StatelessWidget {
  const ColorChangeButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.hoverColor,
    required this.nonHoverColor,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final Color hoverColor;
  final Color nonHoverColor;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: DesktopCCButton(
        text: text,
        onTap: onTap,
        hoverColor: hoverColor,
        nonHoverColor: nonHoverColor,
      ),
      tablet: TabCCButton(
        text: text,
        onTap: onTap,
        hoverColor: hoverColor,
        nonHoverColor: nonHoverColor,
      ),
      mobile: MobileCCButton(
        text: text,
        onTap: onTap,
        hoverColor: hoverColor,
        nonHoverColor: nonHoverColor,
      ),
    );
  }
}

class MobileCCButton extends StatefulWidget {
  const MobileCCButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.hoverColor,
    required this.nonHoverColor,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final Color hoverColor;
  final Color nonHoverColor;

  @override
  MobileCCButtonState createState() => MobileCCButtonState();
}

class MobileCCButtonState extends State<MobileCCButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        if (!isHover)
          Container(
            height: 35,
            width: 125,
            decoration: BoxDecoration(
              border: Border.all(color: widget.nonHoverColor, width: 1.5),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 35,
          width: _animatedWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: isHover ? widget.hoverColor : widget.nonHoverColor,
          ),
        ),
        InkWell(
          onHover: (bool value) {
            setState(() {
              isHover = value;
              _animatedWidth = value ? 125 : 0.0;
            });
          },
          onTap: () {
            setState(() => _animatedWidth = 125);
            widget.onTap();
          },
          child: SizedBox(
            height: 35,
            width: 125,
            child: Center(
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  color: theme.textColor,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabCCButton extends StatefulWidget {
  const TabCCButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.hoverColor,
    required this.nonHoverColor,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final Color hoverColor;
  final Color nonHoverColor;

  @override
  TabCCButtonState createState() => TabCCButtonState();
}

class TabCCButtonState extends State<TabCCButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        if (!isHover)
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              border: Border.all(color: theme.textColor, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50,
          width: _animatedWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isHover ? widget.hoverColor : widget.nonHoverColor,
          ),
        ),
        InkWell(
          onHover: (bool value) {
            setState(() {
              isHover = value;
              _animatedWidth = value ? 200 : 0.0;
            });
          },
          onTap: () {
            setState(() => _animatedWidth = 200);
            widget.onTap();
          },
          child: SizedBox(
            height: 50,
            width: 200,
            child: Center(
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  color: theme.textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DesktopCCButton extends StatefulWidget {
  const DesktopCCButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.hoverColor,
    required this.nonHoverColor,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final Color hoverColor;
  final Color nonHoverColor;

  @override
  DesktopCCButtonState createState() => DesktopCCButtonState();
}

class DesktopCCButtonState extends State<DesktopCCButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        if (!isHover)
          Container(
            height: 65,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: widget.nonHoverColor, width: 3),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 65,
          width: _animatedWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isHover ? widget.hoverColor : widget.nonHoverColor,
          ),
        ),
        InkWell(
          onHover: (bool value) {
            setState(() {
              isHover = value;
              _animatedWidth = value ? 250 : 0.0;
            });
          },
          onTap: () {
            setState(() => _animatedWidth = 250);
            widget.onTap();
          },
          child: SizedBox(
            height: 65,
            width: 250,
            child: Center(
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(
                  color: isHover ? Colors.white : widget.nonHoverColor,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
