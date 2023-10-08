import 'package:amazon/common/loader.dart';
import 'package:amazon/features/Account/widgets/single_product.dart';
import 'package:amazon/features/admin/service/Admin_service.dart';
import 'package:amazon/features/order_details/screen/order_details.dart';
import 'package:amazon/models/order.dart';
import 'package:flutter/material.dart';

class OrdersScren extends StatefulWidget {
  const OrdersScren({super.key});

  @override
  State<OrdersScren> createState() => _OrdersScrenState();
}

class _OrdersScrenState extends State<OrdersScren> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    fetchAllorder();
    super.initState();
  }

  void fetchAllorder() async {
    orders = await adminServices.fetchAllorders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
            itemCount: orders!.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              final orderData = orders![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, OrderDetailScreen.routeName,
                      arguments: orderData);
                },
                child: SizedBox(
                  height: 140,
                  child: SingleProduct(image: orderData.products[0].images[0]),
                ),
              );
            },
          );
  }
}
