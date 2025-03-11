import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:quicks_cart/navigation_menu.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';
import '../../sign_up/sign_up_screen.dart';

class QCLoginForm extends StatelessWidget {
  const QCLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: QCSizes.lg),
        child: Column(
          children: [
            /// Email Text Form Field
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: QCTexts.email,
              ),
            ),
            SizedBox(height: QCSizes.spaceBtwInputFields),

            /// Password Text Form Field
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: QCTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            SizedBox(height: QCSizes.sm),

            /// Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// Remember Me
                    // check box
                    Obx(
                      () => InkWell(
                        onTap: () {
                          loginController.checkBoxValueToggle();
                        },
                        child: Icon(
                          loginController.checkBoxValue.value
                              ? Icons.check_circle
                              : Icons.check_circle,
                          size: QCSizes.iconMd,
                          color:
                              loginController.checkBoxValue.value
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                    Text(
                      QCTexts.rememberMe,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),

                /// Forgot Password
                InkWell(
                  onTap: () {
                    Get.to(() => ForgotPasswordScreen());
                  },
                  child: Text(
                    QCTexts.forgetPassword,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: QCSizes.lg),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => NavigationMenu()),
                child: Text(QCTexts.signIn),
              ),
            ),
            SizedBox(height: QCSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => SignUpScreen());
                },
                child: Text(QCTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
