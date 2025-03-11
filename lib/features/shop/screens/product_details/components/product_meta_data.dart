import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/images/circular_images.dart';
import 'package:quicks_cart/common/widgets/text/product_price_text.dart';
import 'package:quicks_cart/common/widgets/text/product_title_text.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/circular_container.dart';
import '../../../../../common/widgets/text/brand_title_with_verified_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and Sale Price
        Row(
          children: [
            QCCircularContainer(
              height: 30,
              width: 50,
              radius: QCSizes.sm,
              backgroundColor: QCColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: QCSizes.sm,
                vertical: QCSizes.xs,
              ),
              child: Center(
                child: Text(
                  '20%',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(color: QCColors.black),
                ),
              ),
            ),
            SizedBox(width: QCSizes.md),
            Text(
              "\$250",
              style: Theme.of(context).textTheme.labelLarge!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: QCSizes.sm),
            QCProductPriceText(price: "175", isLarge: true),
          ],
        ),
        SizedBox(height: QCSizes.sm),

        /// Title
        QCProductTitleText(title: "Green Nike Air Shoes"),
        SizedBox(height: QCSizes.sm),

        /// Stock Status
        Row(
          children: [
            QCProductTitleText(title: "Status:", smallSize: false),
            SizedBox(width: QCSizes.sm),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: QCSizes.xs),

        ///Brand
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularImages(
              image: QCImages.nikeLogo,
              height: 32,
              width: 32,
              overlayColor:
                  QCHelperFunctions.isDarkMode(context)
                      ? QCColors.light
                      : QCColors.dark,
            ),
            Expanded(
              child: const QCBrandTitleWithVerifiedIcon(
                title: "Nike",
                brandTextSize: TextSizes.medium,
              ),
            ),
          ],
        ),
        SizedBox(height: QCSizes.sm),
      ],
    );
  }
}
