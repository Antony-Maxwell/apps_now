
import 'package:apps_now/application/cartquantity/cart_count_bloc.dart';
import 'package:apps_now/domain/products/products_model/products.dart';
import 'package:apps_now/domain/user/cart_model/cart_model.dart';
import 'package:apps_now/infrastructure/location/location_service.dart';
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/infrastructure/user/user_cart_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class AddToCartContainer extends StatelessWidget {
  AddToCartContainer({
    super.key, required this.product,
  });

  final CartDatabaseHelper _databaseHelper = CartDatabaseHelper();
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  if (BlocProvider.of<CartCountBloc>(context)
                          .state
                          .cartCount <=
                      0) {
                    return;
                  } else {
                    BlocProvider.of<CartCountBloc>(context)
                        .add(Decrement());
                  }
                },
                child: const CircleAvatar(
                  child: Icon(Icons.remove),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              BlocBuilder<CartCountBloc, CartCountState>(
                builder: (context, state) {
                  return Text(
                    state.cartCount.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  BlocProvider.of<CartCountBloc>(context).add(Increment());
                },
                child: const CircleAvatar(
                  child: Icon(Icons.add),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              BlocBuilder<CartCountBloc, CartCountState>(
                builder: (context, state) => 
                GestureDetector(
                  onTap: () async{
                    Position position = await LocationHelper().getCurrentLocation();
                String latLng = '${position.latitude}, ${position.longitude}';
                    String? currentUser = await SharedPrefsHelper().getStringFromPrefs("userName");
                    String? currentRetailer = await SharedPrefsHelper().getStringFromPrefs("Retailer");
                    Cart userCart = Cart(userName: currentUser!, retailerName: currentRetailer!, productName: product.prodName!, productPrice: product.prodRkPrice!, cartQuantity: state.cartCount.toString(), currentLocation: latLng);
                    _databaseHelper.insertCart(userCart,context );
                    BlocProvider.of<CartCountBloc>(context).add(ResetCart());
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 213, 203, 233),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      'Add to Cart',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
