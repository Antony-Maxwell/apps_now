import 'dart:developer';

import 'package:apps_now/application/retailers/bloc/retailers_bloc.dart';
import 'package:apps_now/domain/retailer/retailer_model/retailer_model.dart';
import 'package:apps_now/infrastructure/location/location_service.dart';
import 'package:apps_now/infrastructure/retailer/retailer_sqflite.dart';
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/presentation/home/home_screen.dart';
import 'package:apps_now/presentation/widgets/authenticate_button.dart';
import 'package:apps_now/presentation/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

class RetailerFormScreen extends StatelessWidget {
  RetailerFormScreen({super.key});

  final TextEditingController retailerNameController = TextEditingController();
  final TextEditingController retailerAddressController = TextEditingController();
  final TextEditingController retailerContactController = TextEditingController();
  final TextEditingController retailerIdController = TextEditingController();
  final TextEditingController currentLocationController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final db = RetailerDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    SharedPrefsHelper().setLastVisitedScreen("retailerScreen");
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.arrow_back)),
                        const Text(
                          'Resgister a retailer',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox()
                      ],
                    ),
                    Lottie.asset("assets/images/Animation - 1719377682363.json"),
                    CustomTextField(hint: 'Retailer Name', icon: Icons.person, isObscureOrNot: false, controller: retailerNameController, isNumb: false, isLatLng: false,),
                    CustomTextField(hint: 'Contact Number', icon: Icons.call, isObscureOrNot: false, controller: retailerContactController, isNumb: true, isLatLng: false,),
                    CustomTextField(hint: 'Address', icon: Icons.streetview, isObscureOrNot: false, controller: retailerAddressController, isNumb: false, isLatLng: false,),
                    CustomTextField(hint: 'Retailer Id', icon: Icons.password, isObscureOrNot: false, controller: retailerIdController, isNumb: false, isLatLng: false,),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomTextField(hint: 'Current Location', icon: Icons.location_on_outlined, isObscureOrNot: false, controller: currentLocationController, isNumb: false, isLatLng: true,)),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 82,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade100,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: IconButton(
                              onPressed: ()async{
                              LocationHelper().getCurrentLocation().then((value) {
                                log("${value.longitude} and ${value.latitude}");
                              });
                               Position position = await LocationHelper().getCurrentLocation();
                              String latLng = '${position.latitude}, ${position.longitude}';
                              currentLocationController.text = latLng;
                            }, icon: const Icon(Icons.location_on_outlined, size: 30,),),
                          ),
                        )
                      ],
                    ),
                    AuthButton(formKey: formKey, text: 'Register', function: ()async{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color.fromARGB(255, 183, 153, 225),
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                          'Successfully saved retailer',
                          style: TextStyle(
                            color: Colors.black
                          ),
                        ))
                      );
                      final Retailer retailer = Retailer(retailerName: retailerNameController.text, retailerId: retailerIdController.text, retailerContact: retailerContactController.text, retailerAddress: retailerAddressController.text, retailerLocation: currentLocationController.text);
                      final result = await db.insertRetailer(retailer);
                      retailerNameController.clear();
                      retailerAddressController.clear();
                      retailerContactController.clear();
                      retailerIdController.clear();
                      currentLocationController.clear();
                      BlocProvider.of<RetailersBloc>(context).add(const RetailersEvent.initialize());
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                      print(result);
                    })
                  ],
                ),
              ),
            ),
          
          ),
        )
      ),
    );
  }
}