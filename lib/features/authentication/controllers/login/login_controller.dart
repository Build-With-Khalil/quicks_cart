import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variable
  Rx<bool> checkBoxValue = false.obs;

  /// checkbox value change
  void checkBoxValueToggle() {
    checkBoxValue.value = !checkBoxValue.value;
  }

  /// Login Logic
  void login() {
    // Login Logic
  }
}
