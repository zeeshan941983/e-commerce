import 'package:amazon/common/loader.dart';
import 'package:amazon/constants/global_variables.dart';

import 'package:amazon/features/product_details/screens/product_Detail_screen.dart';

import 'package:amazon/features/search/services/search_services.dart';
import 'package:amazon/features/search/widgets/searched_product.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search_screen extends StatefulWidget {
  static const String routeName = "/search-screen";
  final String searchQuery;
  const Search_screen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<Search_screen> createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {
  final SearchService searchService = SearchService();
  List<Product>? products;
  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    products = await searchService.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  void navigateToSearchScreen(String searchQuery) {
    Navigator.pushNamed(context, Search_screen.routeName,
        arguments: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBar(
              flexibleSpace: Container(
                decoration:
                    BoxDecoration(color: GlobalVaribales.backgroundColor),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      onFieldSubmitted: navigateToSearchScreen,
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(Icons.search),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: 'Search Product',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 16, color: Colors.black26)),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 42,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.wallet_giftcard),
                  ),
                ],
              ),
            )),
        body: products == null
            ? const Loader()
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: products!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, ProductDetailScreen.routeName,
                                arguments: products![index]),
                            child: SearchedProduct(
                              product: products![index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ));
  }
}
