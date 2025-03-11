import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/features/authentication/screens/sign_up/components/qc_sign_up_form.dart';
import 'package:quicks_cart/features/authentication/screens/sign_up/components/qc_sign_up_header.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

import '../../../../common/widgets/login_signup/qc_form_divider.dart';
import '../../../../common/widgets/login_signup/qc_social_button.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Iconsax.arrow_left_1,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: QCSizes.sm * 1.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo & Title
              QCSignUpHeader(),
              SizedBox(height: QCSizes.spaceBtwItems),

              /// Form
              QCSignUpForm(),
              SizedBox(height: QCSizes.spaceBtwItems),

              /// Divider
              QCFormDivider(dividerText: QCTexts.orSignUpWith),
              SizedBox(height: QCSizes.spaceBtwItems),

              /// Footer
              QCSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
