
import 'package:flutter/material.dart';

class MainImageContainer extends StatelessWidget {
  const MainImageContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.35), // Shadow color with opacity
              spreadRadius: 3, // How much the shadow will spread
              blurRadius: 5, // How much the shadow will blur
              offset: Offset(3, 3), // Offset in the x and y directions
            )
          ],
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image:
                  NetworkImage("https://wallpaperaccess.com/full/1624960.jpg"),
              fit: BoxFit.cover)),
    );
  }
}
