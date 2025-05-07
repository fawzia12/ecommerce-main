import 'package:app/features/auth/screen/sign_in_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Richtext extends StatefulWidget {
  const Richtext({super.key, required this.ontap});
  final Function() ontap;
  @override
  State<Richtext> createState() => _RichtextState();
}

class _RichtextState extends State<Richtext> {
  //  final Function() ontape;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Dont have a account?",
        style: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w600,
        ),

        children: [
          TextSpan(
            text: 'Sign in',
            style: const TextStyle(color: Colors.red),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = widget.ontap,
                    // এখানে যেকোনো ফাংশন কল করতে পারো
                    // Navigator.pushNamed(context,SignInScreen.home);
                    // print('Sign up tapped');
                 
          ),
        ],
      ),
    );
  }
}
