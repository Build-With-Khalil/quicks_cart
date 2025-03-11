import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/data/repositories/authentication/authentication_repository.dart';
import 'package:quicks_cart/data/repositories/user/user_repository.dart';
import 'package:quicks_cart/features/authentication/screens/sign_up/email/verify_email_screen.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/popups/full_screen_loader.dart';
import 'package:quicks_cart/utils/popups/loaders.dart';

import '../../../../model/user/user_model.dart';
import '../../../../utils/helpers/network_manager.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final privacyPolicy = false.obs;
  final hidePassword = true.obs;

  /// Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  /// Sign Up Logic
  void signUp() async {
    try {
      // Start loading
      QCFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
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
      if (!signUpFormKey.currentState!.validate()) {
        QCFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        QCFullScreenLoader.stopLoading();
        QCLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you must read & accept the privacy policy.',
        );
        return;
      }

      /// Register user in Firebase Authentication & Save User Data
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            emailController.text.trim(),
            passwordController.text.trim(),
          );

      // Save Authenticated User Data in Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        userName: userNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loading
      QCFullScreenLoader.stopLoading();

      // Show Success Message
      QCLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Account created successfully. Verify email to continue.',
      );

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: emailController.text.trim()));
    } catch (e) {
      // Remove Loading
      QCFullScreenLoader.stopLoading();

      // Show Error Message
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
