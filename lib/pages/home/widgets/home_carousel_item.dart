import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/util/strings.dart';
import 'color_change_button.dart';

class HomeCarouselItem extends StatelessWidget {
  const HomeCarouselItem({
    super.key,
    required this.image,
    required this.titleText,
    required this.subTitleText,
    required this.buttonText,
    required this.topPosition,
    required this.leftPosition,
    required this.navigateToIndex,
    this.homeTitleTextColour,
    this.homeSubtitleTextColour,
  });

  HomeCarouselItem.mainItem({
    super.key,
  })  : image = mainImage,
        titleText = mainTitleText,
        homeTitleTextColour = textColor,
        homeSubtitleTextColour = primaryColor,
        subTitleText = mainSubtitleText,
        topPosition = 100,
        leftPosition = 100,
        navigateToIndex = 1,
        buttonText = mainButtonText;

  HomeCarouselItem.freedomItem({
    super.key,
  })  : image = freedomImage,
        titleText = freedomTitleText,
        subTitleText = freedomSubtitleText,
        homeTitleTextColour = whiteColor,
        homeSubtitleTextColour = lightOrangeColor,
        topPosition = 100,
        leftPosition = 100,
        navigateToIndex = 1,
        buttonText = freedomButtonText;

  HomeCarouselItem.worriesItem({
    super.key,
  })  : image = worriesImage,
        titleText = worriesTitleText,
        subTitleText = worriesSubtitleText,
        homeTitleTextColour = whiteColor,
        homeSubtitleTextColour = lightOrangeColor,
        topPosition = 100,
        leftPosition = 780,
        navigateToIndex = 3,
        buttonText = worriesButtonText;

  final String image;
  final String titleText;
  final String subTitleText;
  final String buttonText;
  final double topPosition;
  final double leftPosition;
  final Color? homeTitleTextColour;
  final Color? homeSubtitleTextColour;
  final int navigateToIndex;

  @override
  Widget build(BuildContext context) {
    final TabsRouter tabsRouter = AutoTabsRouter.of(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: topPosition,
          left: leftPosition == 780
              ? _calculateLeftPosition(context)
              : leftPosition,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titleText,
                style: Theme.of(context).homeTitleTextStyle.copyWith(
                      color: homeTitleTextColour,
                    ),
              ),
              Text(
                subTitleText,
                style: Theme.of(context).homeSubtitleTextStyle.copyWith(
                      color: homeSubtitleTextColour,
                    ),
              ),
              const SizedBox(height: 20),
              ColorChangeButton(
                text: buttonText,
                onTap: () {
                  //route to page
                  tabsRouter.setActiveIndex(navigateToIndex);
                },
                hoverColor: homeSubtitleTextColour ?? primaryColor,
                nonHoverColor: homeSubtitleTextColour ?? primaryColor,
              )
            ],
          ),
        ),
      ],
    );
  }

  double _calculateLeftPosition(BuildContext context) {
    return MediaQuery.of(context).size.width - 600;
  }
}
