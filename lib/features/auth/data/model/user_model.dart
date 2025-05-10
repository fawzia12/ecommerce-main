import 'package:flutter/foundation.dart';

class UserModel {
  final String id;
  final String fastname;
  final String lastname;
  final String email;
  final String phone;
  // final String password;
  final String avatarUrl;
  final String city;
  UserModel({
    required this.id,
    required this.fastname,
    required this.lastname,
    required this.email,
    required this.phone,
    // required this.password,
    required this.avatarUrl,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],

      fastname: json['first_name'] ?? 'unknown',
      lastname: json['last_name'] ?? '',
      email: json['email_verified'],
      phone: json['phone'] ?? '',

      avatarUrl: json['avatar_url'],
      city: json['city'],
    );
  }
  Map<String, dynamic> tojson() {
    return {
      "first_name": fastname,
      "last_name": lastname,
      "email": email,

      "phone": phone,
      "city": city,
    };
  }
}
