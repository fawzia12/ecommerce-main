import 'package:app/features/auth/screen/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton({super.key, required this.ontap});
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 190,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue[100],
        ),
        child: Center(
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}
