import 'package:amazon/common/widgets/custom_button.dart';
import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/admin/service/Admin_service.dart';
import 'package:amazon/features/search/screen/search_screen.dart';
import 'package:amazon/models/order.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderDetailScreen extends StatefulWidget {
  static const String routeName = '/order-details';
  final Order order;
  const OrderDetailScreen({
    super.key,
    required this.order,
  });

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int currentstep = 0;
  final AdminServices adminServices = AdminServices();
  void navigateToSearchScreen(String searchQuery) {
    Navigator.pushNamed(context, Search_screen.routeName,
        arguments: searchQuery);
  }

  @override
  void initState() {
    currentstep = widget.order.status;
    super.initState();
  }

// only for admin
  void changeOrderStatus(int status) async {
    adminServices.changeOrderStatus(
        context: context,
        status: status + 1,
        order: widget.order,
        onSuccess: () {
          setState(() {
            currentstep += 1;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'View Order Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Order Date:          ${DateFormat().format(DateTime.fromMillisecondsSinceEpoch(widget.order.orderedAt))}'),
                  Text('Order ID:              ${widget.order.id}'),
                  Text('Order Total:          \$${widget.order.totalprice}'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Parchase Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < widget.order.products.length; i++)
                    Row(
                      children: [
                        Image.network(
                          widget.order.products[i].images[0],
                          height: 120,
                          width: 120,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.order.products[i].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Text("Qty: ${widget.order.quantity[i].toString()}"),
                          ],
                        ))
                      ],
                    )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Tracking',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Stepper(
                    controlsBuilder: (context, details) {
                      if (user.type == 'admin') {
                        return Custom_button(
                            text: "Done",
                            ontap: () =>
                                changeOrderStatus(details.currentStep));
                      }
                      return const SizedBox();
                    },
                    currentStep: currentstep,
                    steps: [
                      Step(
                          title: Text('Pending'),
                          content: Text('Your order is yet to be deliverd'),
                          isActive: currentstep > 0,
                          state: currentstep > 0
                              ? StepState.complete
                              : StepState.indexed),
                      Step(
                          title: Text('Completed'),
                          content: Text(
                              'Your order has been deliverd,you are yet to sign'),
                          isActive: currentstep > 1,
                          state: currentstep > 1
                              ? StepState.complete
                              : StepState.indexed),
                      Step(
                          title: Text('Recived'),
                          content: Text(
                              'Your order has been deliverd,you are yet to signnd by you!'),
                          isActive: currentstep > 2,
                          state: currentstep > 2
                              ? StepState.complete
                              : StepState.indexed),
                      Step(
                          title: Text('Delivered'),
                          content: Text(
                              'Your order has been deliverd,you are yet to signnd by you!'),
                          isActive: currentstep > 3,
                          state: currentstep > 3
                              ? StepState.complete
                              : StepState.indexed),
                    ])),
          ],
        ),
      )),
    );
  }
}
