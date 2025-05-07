import 'package:app/app/app_image_path.dart';
import 'package:app/core/widget/show_snackber_message.dart';
import 'package:app/features/auth/controller/sign_up_controller.dart';
import 'package:app/features/auth/data/model/sign_up_model.dart';
import 'package:app/features/auth/screen/otp_screen.dart';
import 'package:app/features/auth/screen/sign_in_screen.dart';
import 'package:app/features/auth/widget/elevatedbutton.dart';
import 'package:app/features/auth/widget/rich_text.dart';
import 'package:app/features/common/widget/CircularProgressIndicator.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String home = '/sign_up_screen';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController _name1 = TextEditingController();
  final TextEditingController _name2 = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey();
  final SignUpController signUpController = SignUpController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 60),
              Image.asset(AppImagePath.back),

              Container(
                height: 600,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(20),
                ),

                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _fromkey,
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
                            decoration: const InputDecoration(
                              hintText: '  fast name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter  fast your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _name2,
                            decoration: const InputDecoration(
                              hintText: '  last name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter last name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _email,
                            decoration: const InputDecoration(
                              hintText: '  email',
                            ),

                            validator: (String? value) {
                              String email = value ?? '';
                              if (!EmailValidator.validate(email)) {
                                return 'please valied email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _phone,
                            decoration: const InputDecoration(
                              hintText: '  phone',
                            ),
                            validator: (String? value) {
                              String phone = value ?? '';
                              final RegExp bdPhoneRegex = RegExp(
                                r'^(01)[3-9][0-9]{8}$',
                              );
                              if (!bdPhoneRegex.hasMatch(phone)) {
                                return 'enter your valied phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _password,
                            decoration: const InputDecoration(
                              hintText: '  password',
                            ),
                            validator: (String? value) {
                              if ((value!.trim().isEmpty) || value.length < 6) {
                                return 'your password must be 6 caracter';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: _city,
                            decoration: const InputDecoration(
                              hintText: '  city',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter city name';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20),

                          GetBuilder<SignUpController>(
                            builder: (controller) {
                              return Visibility(
                                visible: controller.signUpInProgress == false,
                                replacement: circularprogressindicator(),
                                child: Elevatedbutton(
                                  ontap: () {
                                    _onTapSignUpButton();
                                  },
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 16),
                          Richtext(
                            ontap: () {
                              Navigator.pushNamed(context, SignInScreen.home);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() async {
    if (_fromkey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
        fastname: _name1.text,
        lastname: _name2.text,
        email: _email.text,
        password: _password.text,
        phone: _phone.text,
        city: _city.text,
      );
      final rasult = await signUpController.signUp(signUpModel);
      if (rasult) {
        Navigator.pushNamed(context, OtpScreen.home);
      } else {
        showsnackbar(context, 'something wrong');
      }
    }
  }
}
