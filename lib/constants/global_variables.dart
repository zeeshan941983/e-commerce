import 'package:flutter/material.dart';

String uri = "https://e-commerce-app-zeeshan-d4e3b560946e.herokuapp.com";

class GlobalVaribales {
  //colors
  static const appBarGradiant = LinearGradient(colors: [
    Color.fromARGB(255, 29, 201, 192),
    Color.fromARGB(255, 125, 221, 216)
  ], stops: [
    0.5,
    1.0
  ]);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color lightyellowbackgroundColor = Color(0xffFAF2D3);
  static const Color textfieldbgyellowbackgroundColor = Color(0xffF4E869);
  static const Color purpulecus = Color(0xff91A0F2);
  static const Color peachYello = Color(0xfff7d898);
  static var selectedNavBArColor = Colors.cyan[800]!;
  static const blueground = Colors.blueAccent;
  static const unselectedNavBarColor = Colors.black87;

// STATIC IMAGES
  static const List<String> carouselImages = [
    "https://i.pinimg.com/736x/ca/e7/2c/cae72ce86998abcadd5051acd91a696b.jpg",
    'https://m.media-amazon.com/images/G/31/saba/sep23/1242-X-450_BRAND-DAYS._SX1242_QL85_.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img23/beatxp/features/1242-by-450.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Eyewear/Spring_summer/SunglassesTopBrands/sunglasses-and-frames-1242-x-450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
  ];
}
