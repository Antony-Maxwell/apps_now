
import 'package:apps_now/application/cart/bloc/cart_list_bloc.dart';
import 'package:apps_now/domain/user/cart_model/cart_model.dart';
import 'package:apps_now/infrastructure/location/location_service.dart';
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/infrastructure/user/user_cart_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class CartQtyUpdation extends StatefulWidget {
  const CartQtyUpdation({
    super.key,
    required this.price,
    required this.productName, required this.quantity,
  });

  final String price;
  final String productName;
  final int quantity;

  @override
  State<CartQtyUpdation> createState() => _CartQtyUpdationState();
}

class _CartQtyUpdationState extends State<CartQtyUpdation> {
  late int qty;
  @override
  void initState() {
    qty = widget.quantity;
    super.initState();
  }

  void _incrementQty() {
    setState(() {
      qty++;
    });
  }

  void _decrementQty() {
    if (qty > 0) {
      setState(() {
        qty--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade700,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () async {
                       _decrementQty();
                      Position position = await LocationHelper().getCurrentLocation();
                String latLng = '${position.latitude}, ${position.longitude}';
                    String? currentUser = await SharedPrefsHelper().getStringFromPrefs("userName");
                    String? currentRetailer = await SharedPrefsHelper().getStringFromPrefs("Retailer");
                      Cart cart = Cart(userName: currentUser!, retailerName: currentRetailer!, productName: widget.productName, productPrice: widget.price, cartQuantity: qty.toString(), currentLocation: latLng);
                      await CartDatabaseHelper().updateCart(cart);
                      BlocProvider.of<CartListBloc>(context).add(CartListEvent.initialize(
        userName: currentUser, retailerName: currentRetailer));
                    },
                    child: Container(
                      width: 28,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 30,
                    child: Center(child: Text('$qty')),
                  ),
                  GestureDetector(
                    onTap: () async {
                      _incrementQty();
                      Position position = await LocationHelper().getCurrentLocation();
                String latLng = '${position.latitude}, ${position.longitude}';
                    String? currentUser = await SharedPrefsHelper().getStringFromPrefs("userName");
                    String? currentRetailer = await SharedPrefsHelper().getStringFromPrefs("Retailer");
                      Cart cart = Cart(userName: currentUser!, retailerName: currentRetailer!, productName: widget.productName, productPrice: widget.price, cartQuantity: qty.toString(), currentLocation: latLng);
                      await CartDatabaseHelper().updateCart(cart);
                      BlocProvider.of<CartListBloc>(context).add(CartListEvent.initialize(
        userName: currentUser, retailerName: currentRetailer));
                    },
                    child: Container(
                      width: 28,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
  }
}
