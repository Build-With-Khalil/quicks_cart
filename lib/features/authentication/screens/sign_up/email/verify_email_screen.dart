import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/data/repositories/authentication/authentication_repository.dart';
import 'package:quicks_cart/features/authentication/controllers/sign_up/verify_email_controller.dart';
import 'package:quicks_cart/utils/constants/text_strings.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: Icon(Icons.clear, color: Theme.of(context).iconTheme.color),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QCSizes.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ///Image
              Image(
                image: AssetImage(QCImages.deliveredEmailIllustration),
                width: QCHelperFunctions.screenWidth() * 0.6,
              ),

              ///Title & Sub-Title
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: QCSizes.spaceBtwItems),
              Text(
                "muhammad.khalil.dev@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: QCSizes.spaceBtwItems),
              Text(
                QCTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: QCSizes.spaceBtwItems),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: Text(QCTexts.tContinue),
                ),
              ),
              SizedBox(height: QCSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text(QCTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
