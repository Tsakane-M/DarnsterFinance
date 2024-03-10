import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/color/colors.dart';
import '../../dimensions/dimensions.dart';
import 'widgets/home_carousel_item.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;

  final List<HomeCarouselItem> carouselItems = <HomeCarouselItem>[
    HomeCarouselItem.mainItem(),
    HomeCarouselItem.worriesItem(),
    HomeCarouselItem.freedomItem(),
  ];

  @override
  Widget build(BuildContext context) {
    const int autoPlayInterval = 6;
    const int autoPlayAnimationDuration = 3;
    const double viewportFraction = 1.0;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: height,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: autoPlayInterval),
              aspectRatio: width / height,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration:
                  const Duration(seconds: autoPlayAnimationDuration),
              viewportFraction: viewportFraction,
              onPageChanged: (int index, _) {
                setState(() {
                  _currentCarouselIndex = index;
                });
              },
            ),
            items: carouselItems.map((HomeCarouselItem item) {
              return Builder(
                builder: (BuildContext context) {
                  return item;
                },
              );
            }).toList(),
          ),
          Positioned(
            bottom: Dimensions.mediumHalved,
            left: Dimensions.zero,
            right: Dimensions.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselItems.map((HomeCarouselItem item) {
                final int index = carouselItems.indexOf(item);
                return Container(
                  width: Dimensions.extraSmall,
                  height: Dimensions.extraSmall,
                  margin:
                      const EdgeInsets.symmetric(horizontal: Dimensions.minute),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentCarouselIndex == index
                        ? primaryColor
                        : nuetralColor,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
