import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/home/screens/category_deals.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  void navigateTOCategory(String category, BuildContext context) {
    Navigator.pushNamed(context, Category_deal_screen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10, right: 20),
          scrollDirection: Axis.horizontal,
          itemCount: GlobalVaribales.categoryImages.length,
          itemExtent: 120,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => navigateTOCategory(
                  GlobalVaribales.categoryImages[index]['title']!, context),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: GlobalVaribales.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 1.8,
                          blurStyle: BlurStyle.inner,
                          offset: Offset.zero)
                    ],
                    border: Border.all(color: Colors.black12)),
                child: Center(
                  child: Text(GlobalVaribales.categoryImages[index]['title']!,
                      style: GoogleFonts.aBeeZee(
                          fontSize: 16, color: Colors.black)),
                ),
              ),
            );
          }),
    );
  }
}
