
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
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.white,
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
                    final totalAmount = qty * double.parse(widget.price);
                      Cart cart = Cart(userName: currentUser!, retailerName: currentRetailer!, productName: widget.productName, productPrice: widget.price, cartQuantity: qty.toString(), currentLocation: latLng, totalAmount: totalAmount.toString());
                      await CartDatabaseHelper().updateCart(cart);
                      BlocProvider.of<CartListBloc>(context).add(CartListEvent.initialize(
        userName: currentUser, retailerName: currentRetailer));
                    },
                    child: Container(
                      width: 36,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade200)
                          ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: 36,
                    height: 40,
                    child: Center(child: Text('$qty', style: const TextStyle(fontSize: 17),)),
                  ),
                  GestureDetector(
                    onTap: () async {
                      _incrementQty();
                      Position position = await LocationHelper().getCurrentLocation();
                String latLng = '${position.latitude}, ${position.longitude}';
                    String? currentUser = await SharedPrefsHelper().getStringFromPrefs("userName");
                    String? currentRetailer = await SharedPrefsHelper().getStringFromPrefs("Retailer");
                    final totalAmount = qty * double.parse(widget.price);
                      Cart cart = Cart(userName: currentUser!, retailerName: currentRetailer!, productName: widget.productName, productPrice: widget.price, cartQuantity: qty.toString(), currentLocation: latLng, totalAmount: totalAmount.toString());
                      await CartDatabaseHelper().updateCart(cart);
                      BlocProvider.of<CartListBloc>(context).add(CartListEvent.initialize(
        userName: currentUser, retailerName: currentRetailer));
                    },
                    child: Container(
                      width: 36,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade200)
                          ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
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
