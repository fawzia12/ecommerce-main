import 'package:app/core/Network_caller/network_caller.dart';
import 'package:app/features/auth/controller/otp_controller.dart';
import 'package:app/features/auth/controller/sign_up_controller.dart';
import 'package:app/features/common/controller/main_bottom_nav_bar_controller.dart';

import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
    Get.put(NetwokCaller());
    Get.put(SignUpController());
    Get.put(OtpController());
  }
}
