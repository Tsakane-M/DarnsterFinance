import 'package:flutter/material.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/util/strings.dart';
import '../../../dimensions/dimensions.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          logoLight,
          height: 30,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        const SizedBox(width: 10),
        Text(
          darnsterTitle,
          style: Theme.of(context).logoTextStyle.copyWith(
              fontSize: Responsive.isDesktop(context)
                  ? Dimensions.large
                  : Dimensions.medium,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
