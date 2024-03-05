import 'package:flutter/material.dart';
import '../../../core/util/strings.dart';

class NavigationBarLogo extends StatelessWidget {
  const NavigationBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          darnsterFinanceLogo,
          height: 100,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
