import 'package:amazon/common/loader.dart';
import 'package:amazon/common/widgets/starts.dart';

import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/home/services/home_Services.dart';
import 'package:amazon/features/product_details/screens/product_Detail_screen.dart';

import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category_deal_screen extends StatefulWidget {
  static const String routeName = "/category-deals";
  final String category;
  const Category_deal_screen({super.key, required this.category});

  @override
  State<Category_deal_screen> createState() => _Category_deal_screenState();
}

class _Category_deal_screenState extends State<Category_deal_screen> {
  List<Product>? productList;
  final HomeServices homeService = HomeServices();
  @override
  void initState() {
    fetchCategoryProduct();
    super.initState();
  }

  fetchCategoryProduct() async {
    productList = await homeService.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
              flexibleSpace: Container(
                decoration:
                    BoxDecoration(color: GlobalVaribales.backgroundColor),
              ),
              title: Text(
                widget.category,
                style: TextStyle(color: Colors.black),
              ))),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Keep shopping for ${widget.category}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                      itemCount: productList!.length,
                      padding: const EdgeInsets.only(left: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, ProductDetailScreen.routeName,
                              arguments: product),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                Container(
                                    height: 300,
                                    width: 180,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black12),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              product.images[0],
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
                                                product.name,
                                                style: GoogleFonts.aBeeZee(
                                                    fontSize: 16),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                '(${product.rating![0].rating.toString()})'),
                                            Stars(
                                                rating:
                                                    product.rating![0].rating),
                                          ],
                                        )
                                      ],
                                    )),
                                Container(
                                  height: 30,
                                  width: 100,
                                  margin: EdgeInsets.only(
                                      top: 10, right: 120, left: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Flexible(
                                      child: Text(
                                        "\$" + product.price.toString(),
                                        style: GoogleFonts.aBeeZee(
                                            color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
