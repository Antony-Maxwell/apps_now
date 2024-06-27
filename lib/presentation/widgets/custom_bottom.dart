
import 'package:apps_now/presentation/home/retailer_form_screen.dart';
import 'package:apps_now/presentation/widgets/custompage_transition.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              child: Text(
                'Are you a Retailer ? Click here >',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(CustomPageRoute(page: RetailerFormScreen()));
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}