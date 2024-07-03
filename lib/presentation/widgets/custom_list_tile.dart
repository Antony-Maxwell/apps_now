
import 'package:apps_now/domain/retailer/retailer_model/retailer_model.dart';
import 'package:apps_now/infrastructure/location/location_service.dart';
import 'package:apps_now/infrastructure/retailer/retailer_sqflite.dart';
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/presentation/home/feedback.dart';
import 'package:apps_now/presentation/home/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.retailer,
  });

  final Retailer retailer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: Text('Check in to ${retailer.retailerName} retailer', style: const TextStyle(fontSize: 18),),
            content: const Text('Do you want to check-in to this retailer, after check-in you cannot check-in to another retailer'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text(
                'Cancel'
              )),
              TextButton(onPressed: () async{
                Position position = await LocationHelper().getCurrentLocation();
                String latLng = '${position.latitude}, ${position.longitude}';
                DateTime now = DateTime.now();
                String formattedTimestamp = now.toIso8601String();
                String? currentUser = await SharedPrefsHelper().getStringFromPrefs("userName");
                Retailer updatedRetailer = Retailer(retailerName: retailer.retailerName, retailerId: retailer.retailerId, retailerContact: retailer.retailerContact, retailerAddress: retailer.retailerAddress, retailerLocation: retailer.retailerLocation, userCurrentTime: formattedTimestamp, userLocation: latLng, userName: currentUser);
                await SharedPrefsHelper().saveStringToPrefs("Retailer", retailer.retailerName);
                await RetailerDatabaseHelper().updateRetailer(updatedRetailer).then((value) {
                  print(value);
                });
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProductsScreen(retailerName: retailer.retailerName),), (route) => false);
              }, child: const Text(
                'Check-in'
              ))
            ],
          );
        },);
      },
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.deepPurple.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                retailer.retailerName,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
