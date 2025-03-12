import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/data/repositories/authentication/authentication_repository.dart';
import 'package:quicks_cart/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/helpers/network_manager.dart';
import 'package:quicks_cart/utils/popups/full_screen_loader.dart';
import 'package:quicks_cart/utils/popups/loaders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  /// Variable
  final emailController = TextEditingController();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  /// Send reset password Email
  sendResetPasswordEmail() async {
    try {
      // start loading
      QCFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        QCImages.decorAnimation,
      );
      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        QCFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!emailFormKey.currentState!.validate()) {
        QCFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        emailController.text.trim(),
      );
      // Remove Loader
      QCFullScreenLoader.stopLoading();
      // Show Success Screen
      QCLoaders.successSnackBar(
        title: 'Email Sent Successfully',
        message: 'Check your email to reset your password'.tr,
      );

      Get.to(() => ResetPasswordScreen(email: emailController.text.trim()));
    } catch (e) {
      // Remove Loader
      QCFullScreenLoader.stopLoading();
      // Show Error Screen
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Resend reset password Email
  reSendResetPasswordEmail(String email) async {
    try {
      // start loading
      QCFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        QCImages.decorAnimation,
      );
      //Check Internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        QCFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      // Remove Loader
      QCFullScreenLoader.stopLoading();
      // Show Success Screen
      QCLoaders.successSnackBar(
        title: 'Email Sent Successfully',
        message: 'Check your email to reset your password'.tr,
      );
    } catch (e) {
      // Remove Loader
      QCFullScreenLoader.stopLoading();
      // Show Error Screen
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
