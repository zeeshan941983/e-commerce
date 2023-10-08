import 'package:amazon/common/loader.dart';

import 'package:amazon/features/home/services/home_Services.dart';

import 'package:amazon/features/product_details/screens/product_Detail_screen.dart';
import 'package:amazon/models/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DealofDay extends StatefulWidget {
  const DealofDay({super.key});

  @override
  State<DealofDay> createState() => _DealofDayState();
}

class _DealofDayState extends State<DealofDay> {
  final HomeServices homeService = HomeServices();
  Product? product;

  @override
  void initState() {
    super.initState();
    fetchDealofDat();
  }

  void fetchDealofDat() async {
    product = await homeService.fetchDealOfDay(context: context);
    setState(() {});
  }

  void gotoDeatailsPage() {
    Navigator.pushNamed(context, ProductDetailScreen.routeName,
        arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Loader()
        : product!.name.isEmpty
            ? const SizedBox()
            : GestureDetector(
                onTap: fetchDealofDat,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: Text(
                        'Deal of the day',
                        style: GoogleFonts.aBeeZee(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200,
                        autoPlay: true,
                      ),
                      items: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              product!.images[0],
                              height: 235,
                              fit: BoxFit.fitHeight,
                            )),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              product!.images[1],
                              height: 235,
                              fit: BoxFit.fitHeight,
                            )),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "\$${product!.price}",
                        style: GoogleFonts.aBeeZee(fontSize: 18),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding:
                          const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: Text(
                        product!.name,
                        style: GoogleFonts.aBeeZee(fontSize: 18),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'See all deals',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
