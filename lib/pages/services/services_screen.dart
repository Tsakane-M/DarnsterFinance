import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/color/colors.dart';
import '../../core/util/strings.dart';
import '../../dimensions/dimensions.dart';
import 'widgets/services_grid_item.dart';

@RoutePage()
class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: Dimensions.medium),
              Center(
                child: Text(
                  servicesTitle,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 1,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                children: <Widget>[
                  ServicesGridItem.personalLoans(),
                  ServicesGridItem.businessLoans(),
                  ServicesGridItem.assetBasedLoans(),
                  ServicesGridItem.ecocash()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
