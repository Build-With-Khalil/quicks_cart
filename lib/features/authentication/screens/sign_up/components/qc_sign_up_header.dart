import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class QCSignUpHeader extends StatelessWidget {
  const QCSignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          QCHelperFunctions.isDarkMode(context)
              ? QCImages.darkAppLogo
              : QCImages.lightAppLogo,
          width: QCHelperFunctions.screenWidth() * 0.4,
        ),
        SizedBox(
          height: QCSizes.xs,
        ),
        Text(
          QCTexts.signupTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
