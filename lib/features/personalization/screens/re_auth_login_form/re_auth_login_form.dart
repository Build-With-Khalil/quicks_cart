import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/utils/constants/text_strings.dart';
import 'package:quicks_cart/utils/validators/validation.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controller/user/user_controller.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: QCAppBar(title: Text("Re-Authenticate User")),
      body: SingleChildScrollView(
        child: Form(
          key: controller.reAuthFormKey,
          child: Column(
            children: [
              ///Email
              TextFormField(
                controller: controller.verifyEmail,
                validator: QCValidator.validateEmail,
                decoration: InputDecoration(
                  labelText: QCTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              SizedBox(height: QCSizes.spaceBtwItems),

              /// Password
              Obx(
                () => TextFormField(
                  controller: controller.verifyPassword,
                  obscureText: controller.hidePassword.value,
                  validator:
                      (value) => QCValidator.validateEmpty('Password', value),
                  decoration: InputDecoration(
                    labelText: QCTexts.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed:
                          () =>
                              controller.hidePassword.value =
                                  !controller.hidePassword.value,
                      icon: Icon(
                        controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: QCSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.reAuthenticateEmailAndPasswordUser,
                  child: Text("Verify"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
