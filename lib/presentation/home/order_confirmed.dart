import 'package:apps_now/infrastructure/user/user_cart_helper.dart';
import 'package:apps_now/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({super.key, required this.orderId, required this.userName, required this.retailerName, required this.location, required this.time, required this.orderTotal});
  final String orderId;
  final String userName;
  final String retailerName;
  final String location;
  final String time;
  final double orderTotal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                const Text(
                  'Order Overview',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 500,
                  width: double.infinity,
                  color: Colors.transparent,
                  child: LottieBuilder.network("https://lottie.host/e8e7fa51-b28e-42d5-8462-58d279aa2e53/ASUIL2ZH2S.json")),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'OverView',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Grand Total : ₹ $orderTotal',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "username : $userName",
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "retailer : $retailerName",
                        style: const TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        "order id : $orderId",
                        
                      ),
                      Text(
                        "location : $location"
                      ),
                      Text(
                        "time : $time"
                      )
                    ],
                  ),
                ),
                TextButton(onPressed: ()async{
                  await CartDatabaseHelper().deleteAllCartItems(userName, retailerName);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
                }, child: Text(
                  'CheckOut from $retailerName',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ))
              ],
            ),
          )),
      ),
    );
  }
}