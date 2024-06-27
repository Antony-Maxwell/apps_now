import 'package:apps_now/domain/user/user/user_model.dart';
import 'package:apps_now/infrastructure/user/user_helper.dart';
import 'package:apps_now/presentation/widgets/authenticate_button.dart';
import 'package:apps_now/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final db = UserDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  title: Text(
                    'Register \nNew Account',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                ),
                //username
                CustomTextField(
                  isLatLng: false,
                  isNumb: false,
                    hint: 'Username',
                    icon: Icons.person,
                    isObscureOrNot: false,
                    controller: usernameController),
                //address
                CustomTextField(
                  isLatLng: false,
                  isNumb: false,
                    hint: 'Address',
                    icon: Icons.streetview,
                    isObscureOrNot: false,
                    controller: addressController),
                //password
                CustomTextField(
                  isLatLng: false,
                  isNumb: false,
                    hint: 'Password',
                    icon: Icons.lock,
                    isObscureOrNot: true,
                    controller: passController),
                //confirm pass
                CustomTextField(
                  isLatLng: false,
                  isNumb: false,
                    hint: 'Confirm Password',
                    icon: Icons.lock,
                    isObscureOrNot: true,
                    controller: confirmPassController),
                //signup button
                AuthButton(
                  formKey: formKey,
                  text: 'SIGNUP',
                  function: () {
                    final Users user = Users(
                      userName: usernameController.text,
                      userPassword: passController.text,
                      address: addressController.text,
                    );
                    db.signUP(user).whenComplete(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color.fromARGB(255, 183, 153, 225),
                          behavior: SnackBarBehavior.floating,
                          content: Text('Successfully signed-in',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          ))
                      );
                      Navigator.pop(context);
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?"),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('LOGIN'))
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
