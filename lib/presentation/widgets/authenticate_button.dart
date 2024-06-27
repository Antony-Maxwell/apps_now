import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.formKey,
    required this.text,
    required this.function,
  });

  final GlobalKey<FormState> formKey;
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 55,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.deepPurple,
      ),
      child: TextButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              function();
            }
          },
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
