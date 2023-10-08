import 'package:amazon/constants/global_variables.dart';

import 'package:amazon/features/Account/widgets/orders.dart';
import 'package:amazon/features/Account/widgets/top_bottons.dart';

import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context, listen: false).user;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(color: GlobalVaribales.backgroundColor),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: "Hello, " + username.name,
                      style: GoogleFonts.armata(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black),
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.notifications_outlined),
                        ),
                        Icon(Icons.search),
                      ],
                    ))
              ],
            ),
          )),
      backgroundColor: GlobalVaribales.backgroundColor,
      body: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TopBottons(),
          SizedBox(
            height: 10,
          ),
          Orders()
        ],
      ),
    );
  }
}
