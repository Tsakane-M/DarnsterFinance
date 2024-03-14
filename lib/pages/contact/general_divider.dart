import 'package:flutter/material.dart';

import '../../core/color/colors.dart';

class DividerGeneral extends StatelessWidget {
  const DividerGeneral({
    Key? key,
    this.height = 1.0,
    this.thickness = 1.0,
    this.indent,
    this.color,
  }) : super(key: key);

  final double height;
  final double thickness;
  final double? indent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: indent,
      color: primaryColor,
    );
  }
}
