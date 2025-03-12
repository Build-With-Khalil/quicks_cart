import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/features/authentication/controllers/forgot_password/forgot_password_controller.dart';
import 'package:quicks_cart/features/authentication/screens/login/login_screen.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(Icons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QCSizes.sm * 1.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Image
              Image(
                image: AssetImage(QCImages.deliveredEmailIllustration),
                width: QCHelperFunctions.screenWidth() * 0.6,
              ),

              /// Title & Sub-Title
              Text(
                QCTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: QCSizes.spaceBtwItems),
              Text(
                QCTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: QCSizes.spaceBtwItems * 2),

              /// Submit Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: Text(QCTexts.done),
                ),
              ),
              SizedBox(height: QCSizes.spaceBtwItems),

              /// resend email
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed:
                      () => ForgotPasswordController.instance
                          .reSendResetPasswordEmail(email),
                  child: Text(
                    QCTexts.resendEmail,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
