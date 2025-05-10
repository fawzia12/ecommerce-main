class SignInRequestModel {
  String? email;
  String? password;
  SignInRequestModel({required this.email, required this.password});

  Map<String, dynamic> tojson() {
    return {"email": email, "password": password};
  }
}
