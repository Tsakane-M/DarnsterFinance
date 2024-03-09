import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/color/colors.dart';
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
    HomeCarouselItem.freedomItem(),
    HomeCarouselItem.worriesItem(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              viewportFraction: 1.0,
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
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselItems.map((HomeCarouselItem item) {
                final int index = carouselItems.indexOf(item);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
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
