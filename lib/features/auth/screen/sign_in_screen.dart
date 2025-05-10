import 'package:app/app/app_image_path.dart';
import 'package:app/features/auth/widget/elevatedbutton.dart';
import 'package:app/features/auth/widget/rich_text.dart';

import 'package:app/features/home/widget/customtextfiled.dart';

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String home = '/sign_in_screen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Image.asset(AppImagePath.back),

            Container(
              height: 390,
              width: 320,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20),
              ),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Sign -In',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Customtextfiled(text: "email"),
                    SizedBox(height: 10),
                    Customtextfiled(text: 'password'),
                    SizedBox(height: 10),

                    Elevatedbutton(text: 'signIn', ontap: () {}),
                    SizedBox(height: 20),

                    Richtext(
                      text1: "Dont have a account?",
                      text2: "SignIn",
                      ontap: () {
                        Navigator.pushNamed(context, SignInScreen.home);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
