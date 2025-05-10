import 'package:app/app/app_urls.dart';
import 'package:app/core/Network_caller/network_caller.dart';
import 'package:app/features/auth/data/model/sign_in_request_model.dart';
import 'package:app/features/auth/data/model/user_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class SignInController extends GetxController {
  // String? nano;
  bool _signInprogrss = false;
  bool get progress => _signInprogrss;
  String? _errormessage;
  String? get errormessage => _errormessage;
  Future<bool> signIn(SignInRequestModel signinmodel) async {
    bool issucesss = false;
    _signInprogrss = true;

    update();
    final Networkresponse response = await Get.find<NetwokCaller>().postrequest(
      url: AppUrls.signIn,
      body: signinmodel.tojson(),
    );
    if (response.issuccess) {
      issucesss = true;
      //save data
      UserModel userModel = UserModel.fromJson(
        response.responsedata!['data']['user'],
      );
      //save token
      String accessToken = response.responsedata!['data']['token'];
    } else {
      _errormessage = errormessage;
    }
    _signInprogrss = false;
    return issucesss;
  }
}
