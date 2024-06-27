import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    required this.isObscureOrNot,
    required this.controller,
    required this.isNumb,
    required this.isLatLng,
  });
  final String hint;
  final IconData icon;
  final bool isObscureOrNot;
  final bool isNumb;
  final bool isLatLng;
  final TextEditingController controller;

  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isVisible,
      builder: (context, value, child) => Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.deepPurple.withOpacity(.2)),
        child: TextFormField(
          controller: controller,
          maxLength: isLatLng? 30 : 10,
          keyboardType: isNumb? TextInputType.phone : TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isObscureOrNot ? _isVisible.value : false,
          decoration: InputDecoration(
              icon: Icon(icon),
              border: InputBorder.none,
              hintText: hint,
              suffixIcon: isObscureOrNot
                  ? IconButton(
                      onPressed: () {
                        _isVisible.value = !_isVisible.value;
                      },
                      icon: Icon(_isVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )
                  : null),
          validator: (value) {
            if (value!.isEmpty) {
              return "$hint is required";
            }
            return null;
          },
        ),
      ),
    );
  }
}
