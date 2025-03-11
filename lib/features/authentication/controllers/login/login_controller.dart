import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';
import '../../../personalization/controller/user/user_controller.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variable
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  /// Login Logic
  void login() async {
    try {
      // Start loading
      QCFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        QCImages.decorAnimation,
      );

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        QCFullScreenLoader.stopLoading();
        QCLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      // Form Validation (FIXED)
      if (!loginFormKey.currentState!.validate()) {
        QCFullScreenLoader.stopLoading();
        return;
      }

      // Save User Data in Local Storage if remember me is checked
      if (rememberMe.value) {
        localStorage.write('email', emailController.text.trim());
        localStorage.write('password', passwordController.text.trim());
      }

      /// Register user in Firebase Authentication & Save User Data
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
            emailController.text.trim(),
            passwordController.text.trim(),
          );

      // Remove Loading
      QCFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loading
      QCFullScreenLoader.stopLoading();

      // Show Error Message
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void googleSignIn() async {
    try {
      // Start loading
      QCFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        QCImages.decorAnimation,
      );

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        QCFullScreenLoader.stopLoading();
        QCLoaders.errorSnackBar(
          title: 'No Internet',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      /// Register user in Firebase Authentication & Save User Data
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      /// Save User Data
      await userController.saveUserRecord(userCredential);
      // Remove Loading
      QCFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loading
      QCFullScreenLoader.stopLoading();

      // Show Error Message
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
