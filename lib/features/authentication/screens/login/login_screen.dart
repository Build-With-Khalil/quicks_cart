import 'package:flutter/material.dart';
import 'package:quicks_cart/features/authentication/screens/login/components/qc_login_form.dart';
import 'package:quicks_cart/features/authentication/screens/login/components/qc_login_header.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/qc_form_divider.dart';
import '../../../../common/widgets/login_signup/qc_social_button.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: QCSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              QCLoginHeader(),

              /// Form
              QCLoginForm(),

              /// Divider
              QCFormDivider(dividerText: QCTexts.orSignInWith),
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
