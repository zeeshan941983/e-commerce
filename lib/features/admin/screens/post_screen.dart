import 'package:amazon/common/loader.dart';
import 'package:amazon/features/Account/widgets/single_product.dart';
import 'package:amazon/features/admin/screens/Add_products.dart';
import 'package:amazon/features/admin/service/Admin_service.dart';
import 'package:amazon/models/product.dart';

import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    fetchAllProducts();
    super.initState();
  }

  void deleteproduct(Product product, int index) {
    adminServices.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
        });
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, Add_products.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final productdata = products![index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: SingleProduct(image: productdata.images[0]),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            productdata.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          )),
                          IconButton(
                              onPressed: () =>
                                  deleteproduct(productdata, index),
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddProduct,
              tooltip: 'Add a product',
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
