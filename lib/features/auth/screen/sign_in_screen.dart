import 'package:app/app/app_image_path.dart';
import 'package:app/features/common/screen/bottom_nav_bar.dart';
import 'package:app/features/auth/screen/sign_up_screen.dart';
import 'package:app/features/home/widget/customtextfiled.dart';

import 'package:flutter/gestures.dart';

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
                    GestureDetector(
                      child: Container(
                        height: 50,
                        width: 190,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blue[100],
                        ),
                        child: Center(
                          child: Text(
                            'login',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, BottomNavBar.home);
                      },
                    ),
                    SizedBox(height: 20),

                    RichText(
                      text: TextSpan(
                        text: "Dont have a account?",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(color: Colors.red),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      SignUpScreen.home,
                                    );
                                  },
                          ),
                        ],
                      ),
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
