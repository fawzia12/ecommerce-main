import 'package:flutter/foundation.dart';

class OtpModel {
  String? email;
  String? otp;
  OtpModel({required this.email, required this.otp}
  
  );

  Map<String, dynamic> tojson() {
    return {"email": email, "otp": otp};
  }
}
