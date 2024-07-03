
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/presentation/home/cart_screen.dart';
import 'package:apps_now/presentation/home/feedback.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey, required this.isMainScreen, required this.title, required this.isCart, required this.isProd,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;
  final bool isMainScreen;
  final String title;
  final bool isCart;
  final bool isProd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: isMainScreen
      ?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.more_vert_outlined,
                size: 30,
              )
              ),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          const Icon(
            Icons.search,
            size: 30,
          )
        ],
      )
      :
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isProd
          ?
          IconButton(onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => FeedbackScreen(),), (route) => false) ;
          }, icon: const Icon(Icons.logout))
          :
          const SizedBox(),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          isCart
          ?
          GestureDetector(
            onTap: () async{
              String? currentUser = await SharedPrefsHelper().getStringFromPrefs("userName");
                    String? currentRetailer = await SharedPrefsHelper().getStringFromPrefs("Retailer");
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen(retailerName: currentRetailer!, userName: currentUser!),));
            },
            child: const Icon(
                  Icons.card_travel,
                  size: 30,
                ),
          )
              :
          const Icon(
            Icons.search,
            size: 30,
          )
        ],
      ),
    );
  }
}
