import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neostore/utils/models/carousel_item.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
            items: CarouselItem.carouselItems.map((e) {
              return Image.asset(
                e.location,
                fit: BoxFit.fill,
              );
            }).toList(),
            options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (int index, _) {
                  setState(() {
                    _selectedIndex = index;
                  });
                })),
        Positioned(
          bottom: 10,
          child: Center(
            child: CarouselIndicator(
              height: 10,
              width: 10,
              activeColor: Colors.white,
              color: Colors.black,
              cornerRadius: 5,
              index: _selectedIndex,
              count: CarouselItem.carouselItems.length,
            ),
          ),
        )
      ],
    );
  }
}
