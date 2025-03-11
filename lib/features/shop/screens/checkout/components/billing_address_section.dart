import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/text/section_heading.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';

class QCBillingAddressSection extends StatelessWidget {
  const QCBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QCSectionHeadings(
          title: "Shipping Address",
          buttonTitle: "Change",
          showActionButton: true,
        ),
        Text("Karachi, Pakistan", style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            Icon(Iconsax.call, color: QCColors.grey, size: 16),
            SizedBox(width: QCSizes.sm),
            Text(
              "+92 311 276 4610",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Row(
          children: [
            Icon(Iconsax.location, color: QCColors.grey, size: 16),
            SizedBox(width: QCSizes.sm),
            Text(
              "House # 123, Street # 123, Sector 123",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
