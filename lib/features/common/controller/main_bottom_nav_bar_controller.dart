import 'package:get/get.dart';

class MainBottomNavBarController extends GetxController {
  int _selectindex = 0;
  int get selectindex => _selectindex;
  void changevalue(int index) {
    _selectindex = index;
    update();
  }

  void movetocategory() {
    changevalue(1);
  }

  void backscreen() {
    changevalue(0);
  }
}
