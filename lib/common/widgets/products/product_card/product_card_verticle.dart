import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/styles/product_shadow.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';
import 'package:quicks_cart/common/widgets/images/rounded_image.dart';
import 'package:quicks_cart/common/widgets/text/product_price_text.dart';
import 'package:quicks_cart/common/widgets/text/product_title_text.dart';
import 'package:quicks_cart/features/shop/screens/product_details/product_details_screen.dart';
import 'package:quicks_cart/utils/constants/colors.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../icon/circular_icon.dart';
import '../../text/brand_title_with_verified_icon.dart';

class QCProductCardVerticle extends StatelessWidget {
  const QCProductCardVerticle({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius, and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen()),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [QCProductShadow.verticleProductShadow],
          borderRadius: BorderRadius.circular(QCSizes.productImageRadius),
          color: dark ? QCColors.darkerGrey : QCColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail Image, Heart Button, Discount Tag
            QCCircularContainer(
              height: 180,
              padding: EdgeInsets.all(1),
              backgroundColor: dark ? QCColors.darkerGrey : QCColors.white,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  QCRoundedImage(
                    imageURL: QCImages.productImage1,
                    applyImageRadius: true,
                    backgroundColor: dark ? QCColors.dark : QCColors.light,
                  ),

                  /// -- Heart Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: QCCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),

                  /// -- Discount Tag
                  Positioned(
                    top: 10,
                    left: 5,
                    child: QCCircularContainer(
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
                          style: Theme.of(context).textTheme.labelLarge!
                              .copyWith(color: QCColors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// -- Details
            Padding(
              padding: EdgeInsets.only(left: QCSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Title
                  QCProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  SizedBox(height: QCSizes.xs),
                  QCBrandTitleWithVerifiedIcon(title: 'Nike'),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Padding(
                  padding: const EdgeInsets.only(left: QCSizes.sm),
                  child: QCProductPriceText(price: "120"),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: QCColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(QCSizes.cardRadiusMd),
                      bottomRight: Radius.circular(QCSizes.cardRadiusMd),
                    ),
                  ),
                  child: SizedBox(
                    height: QCSizes.iconLg * 1.2,
                    width: QCSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(Iconsax.add, color: QCColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
