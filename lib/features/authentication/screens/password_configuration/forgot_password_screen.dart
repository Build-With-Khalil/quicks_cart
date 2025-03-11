import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:quicks_cart/utils/constants/text_strings.dart';

import '../../../../utils/constants/sizes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Iconsax.arrow_left_1),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QCSizes.sm * 1.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Headings
              Text(
                QCTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: QCSizes.spaceBtwItems),
              Text(
                QCTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: QCSizes.spaceBtwItems * 2),

              /// Email Text Form Field
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct),
                  labelText: QCTexts.email,
                ),
              ),
              SizedBox(height: QCSizes.spaceBtwSections),

              /// Submit Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(() => ResetPasswordScreen()),
                  child: Text(QCTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
