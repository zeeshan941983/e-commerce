import 'package:amazon/common/loader.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/Account/services/account_services.dart';
import 'package:amazon/features/Account/widgets/single_product.dart';
import 'package:amazon/features/order_details/screen/order_details.dart';
import 'package:amazon/models/order.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //tempory lis
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      "Your Orders",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        color: GlobalVaribales.selectedNavBArColor,
                      ),
                    ),
                  ),

                  ///display products
                ],
              ),
              Container(
                height: 170,
                padding: EdgeInsets.only(left: 10, top: 20, right: 0),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orders!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, OrderDetailScreen.routeName,
                              arguments: orders![index]);
                        },
                        child: SingleProduct(
                            image: orders![index].products[0].images[0]),
                      );
                    }),
              )
            ],
          );
  }
}
