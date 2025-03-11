import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';
import 'package:quicks_cart/utils/constants/colors.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class QCBillingPaymentSection extends StatelessWidget {
  const QCBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        QCSectionHeadings(
          title: "Payment Method",
          showActionButton: true,
          buttonTitle: "Change",
        ),
        Row(
          children: [
            QCCircularContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? QCColors.light : QCColors.white,
              padding: EdgeInsets.all(QCSizes.sm),
              child: Image(
                image: AssetImage(QCImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            Text("PayPal", style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
