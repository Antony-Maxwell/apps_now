
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  CustomCarousel({
    super.key,
  });

  final imageList = [
    "assets/images/retail1.webp",
    "assets/images/retail2.webp",
    "assets/images/retail3.jpg",
    "assets/images/retail4.webp",
     "assets/images/retail5.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
        ]
      ),
      child: CarouselSlider(
        items: imageList
            .map((item) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ))
            .toList(),
        options: CarouselOptions(
          initialPage: 0,
          viewportFraction: 1,
          enlargeCenterPage: false,
          autoPlay: true,
          onPageChanged: (index, reason) {
            
          },
        ),
      ),
    );
  }
}
