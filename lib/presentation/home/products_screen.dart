import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:apps_now/infrastructure/products/products_helper.dart';
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/presentation/widgets/custom_appbar.dart';
import 'package:apps_now/presentation/widgets/product_grid_tile.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key, required this.retailerName});
  final String retailerName;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SharedPrefsHelper().setLastVisitedScreen("productScreen");
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                CustomAppBar(
                  isCart: true,
                    scaffoldKey: _scaffoldKey,
                    isMainScreen: false,
                    title: 'Available Products'),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text('Currently checked-in with $retailerName')),
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<Product>>(
                  future: ProductsHelper().getAllProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing:
                                      15.0, // Space between columns
                                  mainAxisSpacing: 15.0, // Space between rows
                                  // childAspectRatio: 1.0,
                                  mainAxisExtent: 250),
                          itemBuilder: (context, index) {
                            final product = snapshot.data![index];
                            return ProductGridTile(product: product);
                          });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
