import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  static String home = '/pin';
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _pincode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Center(
                child: Text(
                  'Enter OTP code ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 20),
              PinCodeTextField(
                enabled: true,

                length: 6,
                appContext: context,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  borderRadius: BorderRadius.circular(12),
                  shape: PinCodeFieldShape.box,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.red,
                  inactiveFillColor: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: () {}, child: Text('pin code')),
            ],
          ),
        ),
      ),
    );
  }
}
