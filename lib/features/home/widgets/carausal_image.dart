import 'package:amazon/constants/global_variables.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CaraousalImage extends StatelessWidget {
  const CaraousalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVaribales.carouselImages.map((i) {
        return Builder(
            builder: (BuildContext context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    i,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ));
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 200,
        autoPlay: true,
      ),
    );
  }
}
