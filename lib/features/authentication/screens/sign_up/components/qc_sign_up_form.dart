import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/sign_up/sign_up_controller.dart';

class QCSignUpForm extends StatelessWidget {
  const QCSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    return Form(
      key: signUpController.signUpFormKey,
      child: Column(
        children: [
          /// First Name & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: signUpController.firstNameController,
                  validator:
                      (value) => QCValidator.validateEmpty('First name', value),
                  decoration: InputDecoration(
                    labelText: QCTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(width: QCSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: signUpController.lastNameController,
                  validator:
                      (value) => QCValidator.validateEmpty('Last name', value),
                  decoration: InputDecoration(
                    labelText: QCTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: QCSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            controller: signUpController.userNameController,
            validator: (value) => QCValidator.validateEmpty('Username', value),
            decoration: InputDecoration(
              labelText: QCTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          SizedBox(height: QCSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: signUpController.emailController,
            validator: (value) => QCValidator.validateEmail(value),
            decoration: InputDecoration(
              labelText: QCTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          SizedBox(height: QCSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: signUpController.phoneNumberController,
            validator: (value) => QCValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              labelText: QCTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          SizedBox(height: QCSizes.spaceBtwInputFields),

          /// Password
          Obx(
            () => TextFormField(
              controller: signUpController.passwordController,
              validator: (value) => QCValidator.validatePassword(value),
              obscureText: signUpController.hidePassword.value,
              decoration: InputDecoration(
                labelText: QCTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed:
                      () =>
                          signUpController.hidePassword.value =
                              !signUpController.hidePassword.value,
                  icon: Icon(
                    signUpController.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: QCSizes.spaceBtwItems),

          /// Terms & Conditions checkbox
          PrivacyPolicyAndTermsOfUse(),
          SizedBox(height: QCSizes.spaceBtwItems),

          ///Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => signUpController.signUp(),
              child: Text(QCTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

class PrivacyPolicyAndTermsOfUse extends StatelessWidget {
  const PrivacyPolicyAndTermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // check box
        Obx(
          () => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged:
                (value) =>
                    controller.privacyPolicy.value =
                        !controller.privacyPolicy.value,
          ),
        ),

        /// privacy policy and terms of use
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "${QCTexts.iAgreeTo} ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: QCTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color:
                      QCHelperFunctions.isDarkMode(context)
                          ? QCColors.white
                          : QCColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      QCHelperFunctions.isDarkMode(context)
                          ? QCColors.white
                          : QCColors.primary,
                ),
              ),
              TextSpan(
                text: " ${QCTexts.and} ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: QCTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color:
                      QCHelperFunctions.isDarkMode(context)
                          ? QCColors.white
                          : QCColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      QCHelperFunctions.isDarkMode(context)
                          ? QCColors.white
                          : QCColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
