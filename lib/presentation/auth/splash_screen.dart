import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/presentation/auth/login_screen.dart';
import 'package:apps_now/presentation/home/cart_screen.dart';
import 'package:apps_now/presentation/home/home_screen.dart';
import 'package:apps_now/presentation/home/products_screen.dart';
import 'package:apps_now/presentation/home/retailer_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<String?> _getLastVisitedScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastScreen');
  }

  static const String keyLogin = "login";

  @override
  Widget build(BuildContext context) {
    _navigateAfterDelay(context);
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage("assets/images/splashimg.png"),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: CircularProgressIndicator())
              ],
            ),
            Text(
              'Now Apps',
              style: TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('For retailers')
          ],
        ),
      ),
    );
  }

  void _navigateAfterDelay(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      whereToGo(context);
    });
  }

  void whereToGo(BuildContext context) async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(keyLogin) ?? false;

        if (isLoggedIn) {
      String? lastScreen = await _getLastVisitedScreen();
      if (lastScreen != null) {
        Widget screen = await getScreen(lastScreen);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
          (route) => false,
        );
      }
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false,
      );
    }
  }

  Future<Widget>getScreen(String screenName) async{
    String? retailerName = await SharedPrefsHelper().getStringFromPrefs("Retailer");
    String? userName = await SharedPrefsHelper().getStringFromPrefs("userName");
    switch (screenName) {
      case 'homeScreen':
        return HomeScreen();
      case 'retailerScreen':
        return RetailerFormScreen();
      case 'productScreen':
        return ProductsScreen(retailerName: retailerName!);
      case 'cartScreen':
        return CartScreen(userName: userName!, retailerName: retailerName!);
      default:
        return HomeScreen();
    }
  }
}
