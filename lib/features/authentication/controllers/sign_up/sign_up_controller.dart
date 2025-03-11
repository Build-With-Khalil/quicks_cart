import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/popups/full_screen_loader.dart';
import 'package:quicks_cart/utils/popups/loaders.dart';

import '../../../../utils/helpers/network_manager.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// variable
  final privacyPolicy = false.obs;
  final hidePassword = true.obs;

  /// controller
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// sign Up Logic
  Future<void> signUp() async {
    try {
      // start loading
      QCFullScreenLoader.openLoadingDialog(
        'We are processing you information...',
        QCImages.decorAnimation,
      );
      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;
      // Form Validation
      if (signUpFormKey.currentState!.validate()) return;

      // privacy policy check
      if (!privacyPolicy.value) {
        QCLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you must read & accept the privacy policy.',
        );
        return;
      }
      // Register user in the Firebase Authentication & save user data in firebase
    } catch (e) {
      // show some generic error to the user
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // remove loading
      QCFullScreenLoader.stopLoading();
    }
  }
}
