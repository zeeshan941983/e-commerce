import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/home/widgets/all_Products.dart';

import 'package:amazon/features/home/widgets/deal_ofTheday.dart';
import 'package:amazon/features/home/widgets/top_catagories.dart';

import 'package:amazon/features/search/screen/search_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchScreen(String searchQuery) {
    Navigator.pushNamed(context, Search_screen.routeName,
        arguments: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(color: GlobalVaribales.backgroundColor),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    cursorColor: GlobalVaribales.purpulecus,
                    onFieldSubmitted: navigateToSearchScreen,
                    decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
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
      backgroundColor: GlobalVaribales.backgroundColor,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TopCategories(),
            SizedBox(
              height: 10,
            ),
            DealofDay(),
            SizedBox(
              height: 20,
            ),
            All_products()
          ],
        ),
      ),
    );
  }
}
