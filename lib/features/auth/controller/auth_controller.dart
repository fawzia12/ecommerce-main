import 'dart:convert';

import 'package:app/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  String _tokenkey = '_token';
  String _UserDatakey = 'user';
  String? token;
  UserModel? user;
  Future<void> saveUserData(String accessToken, UserModel usermodel) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString(_tokenkey, accessToken);
    //13 line use tojson
    sh.setString(_UserDatakey, jsonEncode(usermodel.tojson()));
    token = accessToken;
    user = usermodel;
  }

  Future<void> getUserData() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    token = sh.getString(_tokenkey);

    String? userData = sh.getString(_UserDatakey);
    if (userData != null) {
      user = UserModel.fromJson(jsonDecode(userData));
    }
  }

  Future<bool> islogedIn() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String? accessToken = sh.getString(_tokenkey);
    if (accessToken != null) {
      await getUserData();
      return true;
    }
    return false;
  }
}
