import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';
import '../../../core/util/strings.dart';

class HomeCarouselItem extends StatelessWidget {
  const HomeCarouselItem({
    super.key,
    required this.image,
    required this.titleText,
    required this.subTitleText,
    required this.buttonText,
    required this.topPosition,
    required this.leftPosition,
  });

  HomeCarouselItem.mainImage({
    super.key,
  })  : image = mainImage,
        titleText = mainText,
        subTitleText = freedomSubtitleText,
        topPosition = 100,
        leftPosition = 100,
        buttonText = mainButtonText;

  HomeCarouselItem.freedomImage({
    super.key,
  })  : image = freedomImage,
        titleText = freedomTitleText,
        subTitleText = freedomSubtitleText,
        topPosition = 100,
        leftPosition = 100,
        buttonText = freedomButtonText;

  HomeCarouselItem.worriesImage({
    super.key,
  })  : image = worriesImage,
        titleText = mainText,
        subTitleText = freedomSubtitleText,
        topPosition = 100,
        leftPosition = 100,
        buttonText = mainButtonText;

  final String image;
  final String titleText;
  final String subTitleText;
  final String buttonText;
  final double topPosition;
  final double leftPosition;

  @override
  Widget build(BuildContext context) {
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
          left: leftPosition,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titleText,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitleText,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
