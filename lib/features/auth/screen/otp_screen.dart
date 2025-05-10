import 'dart:async';

import 'package:app/core/widget/show_snackber_message.dart';
import 'package:app/features/auth/controller/otp_controller.dart';
import 'package:app/features/auth/data/model/otp_model.dart';
import 'package:app/features/auth/screen/sign_in_screen.dart';

import 'package:app/features/common/widget/CircularProgressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});
  final String email;
  static String home = '/pin';
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
    starttimer();
  }

  TextEditingController _pincode = TextEditingController();
  final GlobalKey<FormState> _otpkey = GlobalKey();
  final OtpController _otpController = Get.find<OtpController>();

  int _start = 60;
  Timer? _timer;
  void starttimer() {
    _start = 60; // টাইমার রিসেট করা
    const oneSec = Duration(seconds: 1); // 1 সেকেন্ডে একবার টাইমার আপডেট হবে

    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        _timer?.cancel();
        setState(() {});
      } else {
        _start--;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('VerifyOtp')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _otpkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Center(
                  child: Text(
                    'Coder has been sand to ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Text(
                  widget.email,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),
                PinCodeTextField(
                  controller: _pincode,
                  enabled: true,
                  validator: (value) {
                    if ((value?.length ?? 0) < 4) {
                      return 'enter you pin';
                    }
                    return null;
                  },
                  length: 4,
                  appContext: context,
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    borderRadius: BorderRadius.circular(6),
                    shape: PinCodeFieldShape.box,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.red,
                    inactiveFillColor: Colors.white,
                    fieldHeight: 50,
                    fieldWidth: 50,
                  ),
                ),
                SizedBox(height: 1),
              
                SizedBox(height: 12),
                _start != 0
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'resend code in :',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),

                        Text(
                          '$_start S',

                          style: TextStyle(
                            backgroundColor: Colors.amberAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont recive code?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        SizedBox(width: 9),
                        InkWell(
                          onTap: () {
                            starttimer();
                          },
                          child: Text(
                            'request again',
                            style: TextStyle(
                              backgroundColor: Colors.amberAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                SizedBox(height: 17),
                GetBuilder<OtpController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.OtpInprogress == false,
                      replacement: circularprogressindicator(),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontStyle: FontStyle.normal,
                          ),
                          minimumSize: Size(300, 46),
                        ),
                        onPressed: ontap,
                        child: Text('pin code'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void ontap() {
    if (_otpkey.currentState!.validate()) {
      _otpverify();
    }
  }

  Future<void> _otpverify() async {
    OtpModel otpModel = OtpModel(otp: _pincode.text, email: widget.email);
    bool rasult = await _otpController.Otp(otpModel);
    if (rasult) {
      showsnackbar(context, 'Otp has been verified! Please login');
      Navigator.pushNamedAndRemoveUntil(
        context,
        SignInScreen.home,
        (route) => false,
      );
    } else {
      showsnackbar(context, _otpController.erromessage!);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
