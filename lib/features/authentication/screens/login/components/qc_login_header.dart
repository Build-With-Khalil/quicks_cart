import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class QCLoginHeader extends StatelessWidget {
  const QCLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Logo
        Image.asset(
          QCHelperFunctions.isDarkMode(context)
              ? QCImages.darkAppLogo
              : QCImages.lightAppLogo,
          width: QCHelperFunctions.screenWidth() * 0.4,
        ),
        SizedBox(
          height: QCSizes.lg,
        ),

        /// Title
        Text(
          QCTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: QCSizes.xs,
        ),

        /// Sub-Title
        Text(
          QCTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
