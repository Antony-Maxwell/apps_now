import 'package:apps_now/domain/user/user/user_model.dart';
import 'package:apps_now/infrastructure/sharedprefs/shared_prefs.dart';
import 'package:apps_now/infrastructure/user/user_helper.dart';
import 'package:apps_now/presentation/auth/signup_screen.dart';
import 'package:apps_now/presentation/home/home_screen.dart';
import 'package:apps_now/presentation/widgets/authenticate_button.dart';
import 'package:apps_now/presentation/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final ValueNotifier<bool> isLoginTrue = ValueNotifier<bool>(false);
  final db = UserDatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: isLoginTrue,
        builder: (context, value, child) => Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/login.png",
                    width: 230,
                  ),
                  //username feild
                  CustomTextField(
                    isLatLng: false,
                    isNumb: false,
                    hint: 'Username',
                    icon: Icons.person,
                    isObscureOrNot: false,
                    controller: usernameController,
                  ),
                  //password field
                  CustomTextField(
                    isLatLng: false,
                    isNumb: false,
                    hint: 'Password',
                    icon: Icons.lock,
                    isObscureOrNot: true,
                    controller: passController,
                  ),
                  //login button
                  AuthButton(
                    formKey: formKey,
                    text: 'LOGIN',
                    function: () async {
                      var response = await db.login(Users(
                          userName: usernameController.text,
                          userPassword: passController.text));
                      if (response == true) {
                        SharedPrefsHelper().saveStringToPrefs("userName", usernameController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color.fromARGB(255, 183, 153, 225),
                          behavior: SnackBarBehavior.floating,
                          content: Text('Successfully logged-in', style: TextStyle(color: Colors.black),))
                      );
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                            (route) => false);
                      } else {
                        print('error');
                        isLoginTrue.value = true;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ?"),
                      TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              )),
                          child: const Text('SIGNUP'))
                    ],
                  ),
                  isLoginTrue.value
                      ? const Text(
                          "Username or Password is incorrect",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
