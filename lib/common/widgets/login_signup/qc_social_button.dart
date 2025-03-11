import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class QCSocialButton extends StatelessWidget {
  const QCSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Google
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: QCColors.grey),
          ),
          child: IconButton(
            onPressed: () => loginController.googleSignIn(),
            icon: Image(
              image: AssetImage(QCImages.google),
              width: QCSizes.iconLg,
              height: QCSizes.iconLg,
            ),
          ),
        ),
        SizedBox(width: QCSizes.spaceBtwItems),

        /// Facebook
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: QCColors.grey),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage(QCImages.facebook),
              width: QCSizes.iconLg,
              height: QCSizes.iconLg,
            ),
          ),
        ),
      ],
    );
  }
}
