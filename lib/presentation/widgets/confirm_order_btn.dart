
import 'package:apps_now/application/cart/bloc/cart_list_bloc.dart';
import 'package:apps_now/domain/user/orders/orders_model.dart';
import 'package:apps_now/infrastructure/location/location_service.dart';
import 'package:apps_now/infrastructure/user/user_order_helper.dart';
import 'package:apps_now/presentation/home/order_confirmed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ConfirmOrderButtn extends StatelessWidget {
  const ConfirmOrderButtn({
    super.key,
    required this.userName,
    required this.retailerName, required this.orderTotal,
  });

  final String userName;
  final String retailerName;
  final double orderTotal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartListBloc, CartListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        } else if (state.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: state.cartList.isEmpty
              ? Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Empty....',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm to Order'),
                        content: const Text('Do you want to proceed?..'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                String generateOrderId() {
                                  var uuid = Uuid();
                                  return uuid.v4();
                                }
    
                                Position position =
                                    await LocationHelper().getCurrentLocation();
                                String latLng =
                                    '${position.latitude}, ${position.longitude}';
                                final orderId = generateOrderId();
                                DateTime now = DateTime.now();
    
                                // Define the date format
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd – kk:mm:ss')
                                        .format(now);
                                final order = Orders(
                                    orderId: orderId,
                                    userName: userName,
                                    retailerName: retailerName,
                                    userLocation: latLng,
                                    productsCount:
                                        state.cartList.length.toString(),
                                    totalAmount: orderTotal.toString(),
                                    time: formattedDate);
                                await OrderDatabaseHelper().insertOrder(order);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderConfirmScreen(
                                        orderTotal: orderTotal,
                                          orderId: orderId,
                                          userName: userName,
                                          retailerName: retailerName,
                                          location: latLng,
                                          time: formattedDate),
                                    ),
                                    (route) => false);
                              },
                              child: const Text('Confirm'))
                        ],
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Confirm Order       ₹ $orderTotal',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
