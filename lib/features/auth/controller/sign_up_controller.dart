import 'package:app/app/app_urls.dart';
import 'package:app/core/Network_caller/network_caller.dart';
import 'package:app/features/auth/data/model/sign_up_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _signUpInProgress = false;

  bool get signUpInProgress => _signUpInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpModel signUpModel) async {
    bool isSuccess = false;
    _signUpInProgress = true;
    update();
    final Networkresponse response =
        await Get.find<NetwokCaller>().postrequest(
      url: AppUrls.signup,
      body: signUpModel.tojson(),
    );
    if (response.issuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errormessage;
    }
    _signUpInProgress = false;
    update();
    return isSuccess;
  }
}