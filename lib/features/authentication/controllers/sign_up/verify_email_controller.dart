import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/common/widgets/success/success_screen.dart';
import 'package:quicks_cart/utils/constants/text_strings.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever Verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    checkEmailVerificationStatus();
    super.onInit();
  }

  ///Send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      // Show Success Message
      QCLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your email to verify your account.',
      );
    } catch (e) {
      QCLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///Timer to automatically redirect on Email verification
  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          SuccessScreen(
            image: QCImages.successfulRegisterAnimation,
            title: QCTexts.yourAccountCreatedTitle,
            subTitle: QCTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  ///Manually check if email is verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        SuccessScreen(
          image: QCImages.successfulRegisterAnimation,
          title: QCTexts.yourAccountCreatedTitle,
          subTitle: QCTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
