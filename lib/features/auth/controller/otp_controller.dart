import 'package:app/app/app_urls.dart';
import 'package:app/core/Network_caller/network_caller.dart';
import 'package:app/features/auth/data/model/otp_model.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  bool _OtpInProgress = false;
  bool get OtpInprogress => _OtpInProgress;
  String? _errormessage;
  String? get erromessage => _errormessage;

  Future<bool> Otp(OtpModel otpmodel) async {
    bool issucees = false;
    _OtpInProgress = true;
    update();
    final Networkresponse response = await Get.find<NetwokCaller>().postrequest(
      url: AppUrls.otp,
      body: otpmodel.tojson(),
    );
    if (response.issuccess) {
      _errormessage = null;
      issucees = true;
    } else {
      _errormessage = response.errormessage;
    }
    _OtpInProgress = false;
    update();
    return issucees;
  }
}
