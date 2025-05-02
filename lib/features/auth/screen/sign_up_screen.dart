import 'package:app/app/app_image_path.dart';
import 'package:app/features/auth/screen/sign_in_screen.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String home = '/sign_up_screen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _name1 = TextEditingController();
   final TextEditingController _name2 = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Form(
        key: _fromkey,
        child: Column(
          children: [
            SizedBox(height: 60),
            Image.asset(AppImagePath.back),

            Container(
              height: 460,
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
                        'Sign -Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    SizedBox(height: 26),
                    TextFormField(
                      controller: _name1,
                      decoration: const InputDecoration(hintText: '  fast name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          'enter your name';
                        }
                      },
                    ),
                          SizedBox(height: 10),
                           TextFormField(
                      controller: _name2,
                      decoration: const InputDecoration(hintText: '  last name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          'enter your name';
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(hintText: '  email'),

                      validator: (String? value) {
                        String email = value ?? '';
                        if (!EmailValidator.validate(email)) {
                          'please enter your email';
                        }
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _phone,
                      decoration: const InputDecoration(hintText: '  phone'),
                      validator: (String? value) {
                        String phone = value ?? '';
                        if (phone.length != 11 || phone.startsWith('01')) {
                          'enter your number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(hintText: '  password'),
                      validator: (String? value) {
                        if ((value!.trim().isEmpty) || value.length < 6) {
                          return 'enter your password';
                        }
                      },
                    ),

                    SizedBox(height: 20),
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
                            'Sign up',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    RichText(
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
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                      context,
                                      SignInScreen.home,
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
