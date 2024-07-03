import 'package:apps_now/presentation/auth/login_screen.dart';
import 'package:apps_now/presentation/auth/splash_screen.dart';
import 'package:apps_now/presentation/home/orders.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  Future<String?> _getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userName");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: FutureBuilder<String?>(
          future: _getUserName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Show loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Show error message if any error occurs
            } else {
              final userName = snapshot.data ?? 'Unknown User'; // Use 'Unknown User' if no username is found
              return Column(
                children: [
                  const Text(
                    'AppsNow',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.deepPurple.shade300,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen(),));
                    },
                    leading: const Icon(Icons.shopping_bag_sharp, size: 25,),
                    title: const Text('Orders', style: TextStyle(fontSize: 20),),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      var sharedPref = await SharedPreferences.getInstance();
                      sharedPref.setBool(SplashScreen.keyLogin, false);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: const Text('LogOut'),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
