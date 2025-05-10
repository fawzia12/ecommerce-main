import 'package:app/features/auth/screen/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Richtext extends StatefulWidget {
  const Richtext({super.key, required this.ontap, required this.text1, required this.text2});
  final Function() ontap;
  final String? text1;
  final String? text2;
  @override
  State<Richtext> createState() => _RichtextState();
}

class _RichtextState extends State<Richtext> {
  //  final Function() ontape;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: widget.text1,
        style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),

        children: [
          TextSpan(
            text: widget.text2,
            style: const TextStyle(color: Colors.red),
            recognizer: TapGestureRecognizer()..onTap = widget.ontap,

            // এখানে যেকোনো ফাংশন কল করতে পারো
            // Navigator.pushNamed(context,SignInScreen.home);
            // print('Sign up tapped');
          ),
        ],
      ),
    );
  }
}
