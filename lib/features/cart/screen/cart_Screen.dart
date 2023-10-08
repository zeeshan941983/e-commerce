import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/address/screen/address_Screen.dart';
import 'package:amazon/features/cart/widgets/cart_Product.dart';
import 'package:amazon/features/cart/widgets/cart_Subtotal.dart';

import 'package:amazon/features/search/screen/search_screen.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchScreen(String searchQuery) {
    Navigator.pushNamed(context, Search_screen.routeName,
        arguments: searchQuery);
  }

  void navigateToAddressScreen(int sum) {
    Navigator.pushNamed(context, AddressScreen.routeName,
        arguments: sum.toString());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map(
          (e) => sum += e['quantity'] * e['product']['price'] as int,
        )
        .toList();
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
        body: Column(
          children: [
            const CartSubtotal(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Custom_button(
                text: 'Buy Now (${user.cart.length})',
                ontap: () => navigateToAddressScreen(sum),
                color: GlobalVaribales.purpulecus,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: user.cart.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      padding: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2)),
                      child: CartProduct(index: index),
                    );
                  }),
            )
          ],
        ));
  }
}
