import 'package:apps_now/presentation/home/home_screen.dart';
import 'package:apps_now/presentation/widgets/authenticate_button.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  FeedbackScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('FeedBack why not check-in to retailer', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                TextFormField(
                  maxLength: 50,
                  maxLines: 9,
                  decoration: InputDecoration(
                    hintText: "FeedBack",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                ),
                const SizedBox(height: 50,),
                AuthButton(formKey: formKey, text: 'Send', function: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeScreen(),), (route) => false);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}