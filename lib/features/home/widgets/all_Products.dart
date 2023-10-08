import 'package:amazon/common/loader.dart';
import 'package:amazon/common/widgets/starts.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/home/services/home_Services.dart';
import 'package:amazon/features/product_details/screens/product_Detail_screen.dart';
import 'package:amazon/features/product_details/services/product_details_services.dart';
import 'package:amazon/models/product.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class All_products extends StatefulWidget {
  const All_products({super.key});

  @override
  State<All_products> createState() => _All_productsState();
}

class _All_productsState extends State<All_products> {
  final HomeServices homeService = HomeServices();
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();
  List<Product>? productsList;

  fetchallproducts() async {
    productsList = await homeService.fetchallProducts(context: context);

    setState(() {});
  }

  Future<bool> onLikeButtonTapped(bool isLiked, Product product) async {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );

    return !isLiked;
  }

  @override
  void initState() {
    fetchallproducts();
    super.initState();
  }

  Future addToCart(Product product) async {
    productDetailsServices.addToCart(
      context: context,
      product: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return productsList == null
        ? Center(
            child: Loader(),
          )
        : SizedBox(
            height: 250,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: productsList!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var productData = productsList![index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ProductDetailScreen.routeName,
                      arguments: productData),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                            height: 300,
                            width: 210,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black12),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      productData.images[0],
                                      fit: BoxFit.fill,
                                      height: 150,
                                      width: 150,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        productData.name,
                                        style:
                                            GoogleFonts.aBeeZee(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    LikeButton(
                                      onTap: (isLiked) {
                                        return onLikeButtonTapped(
                                            isLiked, productData);
                                      },
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      animationDuration:
                                          const Duration(milliseconds: 1000),
                                      likeBuilder: (isLiked) {
                                        return const Icon(
                                          Icons.bookmark,
                                          color: GlobalVaribales.purpulecus,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        '(${productData.rating![0].rating.toString()})'),
                                    Stars(
                                        rating: productData.rating![0].rating),
                                    Text(
                                      " (${productData.rating!.length})",
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                )
                              ],
                            )),
                        Container(
                          height: 30,
                          width: 100,
                          margin:
                              EdgeInsets.only(top: 10, right: 120, left: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Flexible(
                              child: Text(
                                "\$" + productData.price.toString(),
                                style: GoogleFonts.aBeeZee(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
