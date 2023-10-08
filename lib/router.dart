import 'package:amazon/common/widgets/bottom_bar.dart';
import 'package:amazon/features/address/screen/address_Screen.dart';
import 'package:amazon/features/admin/screens/Add_products.dart';

import 'package:amazon/features/auth/screens/auth_screen.dart';
import 'package:amazon/features/home/screens/category_deals.dart';
import 'package:amazon/features/home/screens/home_screen.dart';
import 'package:amazon/features/order_details/screen/order_details.dart';
import 'package:amazon/features/product_details/screens/product_Detail_screen.dart';

import 'package:amazon/features/search/screen/search_screen.dart';
import 'package:amazon/models/order.dart';
import 'package:amazon/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> genrateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routename:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routename:
      return MaterialPageRoute(
        builder: (_) => const BottomBar(),
      );
    case Add_products.routeName:
      return MaterialPageRoute(
        builder: (_) => const Add_products(),
      );
    case Category_deal_screen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => Category_deal_screen(
          category: category,
        ),
      );
    case Search_screen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => Search_screen(
          searchQuery: searchQuery,
        ),
      );
    case ProductDetailScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        builder: (_) => ProductDetailScreen(
          product: product,
        ),
      );
    case AddressScreen.routeName:
      var totalamount = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => AddressScreen(
          totalAmount: totalamount,
        ),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        builder: (_) => OrderDetailScreen(
          order: order,
        ),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Screen dos't exist"),
                ),
              ));
  }
}
