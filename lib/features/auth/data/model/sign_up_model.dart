class SignUpModel {
  String? fastname;
  String? lastname;
  String? email;
  String? password;
  String? phone;
  String? city;
  SignUpModel({
    required this.fastname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.phone,
    required this.city,
  });
  Map<String, dynamic> tojson() {
    return {
      "first_name": fastname,
      "last_name": lastname,
      "email": email,
      "password": password,
      "phone": phone,
      "city": city,
    };
  }
}
