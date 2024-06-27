import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:apps_now/presentation/widgets/add_to_cart.dart';
import 'package:apps_now/presentation/widgets/custom_appbar.dart';
import 'package:apps_now/presentation/widgets/main_image_container.dart';
import 'package:apps_now/presentation/widgets/product_details_container.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  DetailedScreen({super.key, required this.product});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Product product;
  final String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomAppBar(
                isCart: false,
                  scaffoldKey: scaffoldKey,
                  isMainScreen: false,
                  title: 'Detailed Product'),
              const SizedBox(
                height: 20,
              ),
              const MainImageContainer(),
              const SizedBox(
                height: 10,
              ),
              ProductDetailsContaienr(product: product, description: description)
            ])),
        bottomNavigationBar: AddToCartContainer(product: product),
      ),
    );
  }
}
