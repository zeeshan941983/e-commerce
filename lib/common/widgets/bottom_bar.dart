import 'package:amazon/constants/global_variables.dart';

import 'package:amazon/features/Account/screens/Account_screen.dart';
import 'package:amazon/features/cart/screen/cart_Screen.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routename = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderwidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen =
        Provider.of<UserProvider>(context, listen: false).user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
        child: BottomNavigationBar(
          backgroundColor: GlobalVaribales.backgroundColor,

          type: BottomNavigationBarType.fixed, // This allows more than 3 items
          currentIndex: _page,
          onTap: updatePage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
                icon: Container(
                  width: 42,
                  decoration: BoxDecoration(),
                  child: badges.Badge(
                    badgeContent: Text(userCartLen.toString()),
                    badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
                    child: Icon(Icons.shopping_cart_outlined),
                  ),
                ),
                label: ''),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
// scaffold(
//       body: pages[_page],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _page,
//         selectedItemColor: GlobalVaribales.selectedNavBArColor,
//         unselectedItemColor: GlobalVaribales.unselectedNavBarColor,
//         backgroundColor: GlobalVaribales.backgroundColor,
        
//         iconSize: 28,
//         onTap: updatePage,
//         items: [
//           //home
//           BottomNavigationBarItem(
//               icon: Container(
//                 width: 42,
//                 decoration: BoxDecoration(
//                     border: Border(
//                         top: BorderSide(
//                             color: _page == 0
//                                 ? GlobalVaribales.selectedNavBArColor
//                                 : GlobalVaribales.backgroundColor,
//                             width: bottomBarBorderwidth))),
//                 child: Icon(Icons.home_outlined),
//               ),
//               label: ''),
//           //accout
//           BottomNavigationBarItem(
//               icon: Container(
//                 width: 42,
//                 decoration: BoxDecoration(
//                     border: Border(
//                         top: BorderSide(
//                             color: _page == 1
//                                 ? GlobalVaribales.selectedNavBArColor
//                                 : GlobalVaribales.backgroundColor,
//                             width: bottomBarBorderwidth))),
//                 child: Icon(Icons.person_outline),
//               ),
//               label: ''),
//           //cart
//           BottomNavigationBarItem(
//               icon: Container(
//                 width: 42,
//                 decoration: BoxDecoration(
//                     border: Border(
//                         top: BorderSide(
//                             color: _page == 2
//                                 ? GlobalVaribales.selectedNavBArColor
//                                 : GlobalVaribales.backgroundColor,
//                             width: bottomBarBorderwidth))),
//                 child: badges.Badge(
//                   badgeContent: Text(userCartLen.toString()),
//                   badgeStyle: badges.BadgeStyle(badgeColor: Colors.white),
//                   child: Icon(Icons.shopping_cart_outlined),
//                 ),
//               ),
//               label: ''),
//         ],
//       ),
//     );