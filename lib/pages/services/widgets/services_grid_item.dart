import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app/utils/on_hover.dart';
import '../../../core/util/strings.dart';
import '../../../dimensions/dimensions.dart';
import '../../../navigation/app_router.gr.dart';

class ServicesGridItem extends StatelessWidget {
  const ServicesGridItem({
    super.key,
    required this.name,
    required this.info,
    required this.link,
    required this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    required this.xTranslation,
  });

  ServicesGridItem.assetBasedLoans({Key? key})
      : this(
          key: key,
          xTranslation: -2,
          imageUrl: assetBasedLoansImage,
          imageHeight: 160,
          link: const AssetBasedLoansScreenRoute(),
          name: assetBasedLoans,
          info:
              'Access small loans to support your business or personal needs with flexible repayment terms.',
        );

  ServicesGridItem.businessLoans({Key? key})
      : this(
          key: key,
          xTranslation: 1,
          imageUrl: businessLoansImage,
          link: const BusinessLoansScreenRoute(),
          imageHeight: 160,
          name: businessLoans,
          info:
              'Access small loans to support your business or personal needs with flexible repayment terms.',
        );

  ServicesGridItem.personalLoans({Key? key})
      : this(
          key: key,
          xTranslation: -2,
          imageUrl: personalLoansImage,
          link: const PersonalLoansScreenRoute(),
          imageHeight: 160,
          name: personalLoans,
          info:
              'Send money to loved ones, pay bills, and buy airtime using your mobile phone.',
        );

  ServicesGridItem.ecocash({Key? key})
      : this(
          key: key,
          xTranslation: 1,
          imageUrl: ecocashImage,
          name: ecocash,
          link: const EcocashScreenRoute(),
          info:
              ' Send money to loved ones, pay bills, and buy airtime using your mobile phone.',
        );

  final String name;
  final PageRouteInfo<dynamic> link;
  final String info;
  final String imageUrl;
  final double? imageWidth;
  final double? imageHeight;
  final double xTranslation;

  @override
  Widget build(BuildContext context) {
    final double translationFactor = MediaQuery.of(context).size.width / 20;
    final double translation = xTranslation * translationFactor;
    return OnHover(
      xTranslation: translation,
      builder: (BuildContext context, bool isHovering) {
        return Container(
          margin: const EdgeInsets.all(Dimensions.paddingRegular),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              // onTapNavCallback();
              context.pushRoute(link);
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Hero(
                  tag: name,
                  child: Image(
                    image: Image.asset(imageUrl,
                            width: imageWidth, height: imageHeight)
                        .image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
