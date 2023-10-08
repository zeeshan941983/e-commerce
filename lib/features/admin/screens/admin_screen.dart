import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/Account/services/account_services.dart';
import 'package:amazon/features/admin/screens/analytics_screen.dart';
import 'package:amazon/features/admin/screens/order_screen.dart';
import 'package:amazon/features/admin/screens/post_screen.dart';

import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderwidth = 5;
  List<Widget> pages = [
    const PostScreen(),
    const AnalyticsScreen(),
    const OrdersScren(),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(gradient: GlobalVaribales.appBarGradiant),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    width: 120,
                    height: 45,
                    color: Colors.black,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.notifications_outlined),
                        ),
                        Icon(Icons.search),
                        TextButton(
                            onPressed: () => AccountServices().logOut(context),
                            child: const Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: GlobalVaribales.backgroundColor),
                            ))
                      ],
                    ))
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVaribales.selectedNavBArColor,
        unselectedItemColor: GlobalVaribales.unselectedNavBarColor,
        backgroundColor: GlobalVaribales.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //post
          BottomNavigationBarItem(
              icon: Container(
                width: 42,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 0
                                ? GlobalVaribales.selectedNavBArColor
                                : GlobalVaribales.backgroundColor,
                            width: bottomBarBorderwidth))),
                child: Icon(Icons.home_outlined),
              ),
              label: ''),
          //analytics
          BottomNavigationBarItem(
              icon: Container(
                width: 42,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 1
                                ? GlobalVaribales.selectedNavBArColor
                                : GlobalVaribales.backgroundColor,
                            width: bottomBarBorderwidth))),
                child: Icon(Icons.analytics_outlined),
              ),
              label: ''),
          //Orders
          BottomNavigationBarItem(
              icon: Container(
                width: 42,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 2
                                ? GlobalVaribales.selectedNavBArColor
                                : GlobalVaribales.backgroundColor,
                            width: bottomBarBorderwidth))),
                child: Icon(Icons.all_inbox_outlined),
              ),
              label: ''),
        ],
      ),
      body: pages[_page],
    );
  }
}
