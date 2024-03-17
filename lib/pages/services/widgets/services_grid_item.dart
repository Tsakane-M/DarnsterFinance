import 'package:flutter/material.dart';

import '../../../app/utils/on_hover.dart';
import '../../../components/image/safe_network_image.dart';
import '../../../core/util/strings.dart';
import '../../../dimensions/dimensions.dart';

class ServicesGridItem extends StatelessWidget {
  const ServicesGridItem({
    super.key,
    required this.name,
    required this.info,
    this.link,
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
          name: assetBasedLoans,
          info:
              'Access small loans to support your business or personal needs with flexible repayment terms.',
        );

  ServicesGridItem.bussinessLoans({Key? key})
      : this(
          key: key,
          xTranslation: 1,
          imageUrl: businessLoansImage,
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
          info:
              ' Send money to loved ones, pay bills, and buy airtime using your mobile phone.',
        );

  final String name;
  final Route<dynamic>? link;
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
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Hero(
                      tag: name,
                      child: SafeNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
