import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';
import 'package:quicks_cart/common/widgets/icon/circular_icon.dart';
import 'package:quicks_cart/common/widgets/images/rounded_image.dart';
import 'package:quicks_cart/common/widgets/text/brand_title_with_verified_icon.dart';
import 'package:quicks_cart/common/widgets/text/product_price_text.dart';
import 'package:quicks_cart/common/widgets/text/product_title_text.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/product_shadow.dart';

class QCProductCardHorizontal extends StatelessWidget {
  const QCProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);

    /// Container with side paddings, color, edges, radius, and shadow
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [QCProductShadow.horizontalProductShadow],
        borderRadius: BorderRadius.circular(QCSizes.productImageRadius),
        color: dark ? QCColors.darkerGrey : QCColors.white,
      ),
      child: Row(
        children: [
          /// Thumbnail
          QCCircularContainer(
            height: 120,
            padding: EdgeInsets.all(QCSizes.sm),
            backgroundColor: dark ? QCColors.dark : QCColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                QCRoundedImage(
                  height: 120,
                  width: 120,
                  imageURL: QCImages.productImage1,
                  backgroundColor: dark ? QCColors.dark : QCColors.light,
                  applyImageRadius: true,
                ),

                /// Sales Tag
                Positioned(
                  top: 0,
                  child: QCCircularContainer(
                    radius: QCSizes.sm,
                    backgroundColor: QCColors.secondary.withOpacity(0.8),
                    padding: EdgeInsets.symmetric(
                      vertical: QCSizes.xs,
                      horizontal: QCSizes.sm,
                    ),
                    child: Text(
                      "25%",
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: QCColors.black),
                    ),
                  ),
                ),

                /// Favourite Icon Button
                Positioned(
                  top: 0,
                  right: 0,
                  child: QCCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: QCSizes.sm, left: QCSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QCProductTitleText(
                        title: "Green Nike Half Sleeves Shirt",
                        smallSize: true,
                      ),
                      SizedBox(height: QCSizes.sm),
                      QCBrandTitleWithVerifiedIcon(title: "Nike"),
                      SizedBox(height: QCSizes.sm),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Price
                          Flexible(
                            child: QCProductPriceText(price: "256.0 - 25689.6"),
                          ),

                          /// Add to Cart Button
                          Container(
                            decoration: BoxDecoration(
                              color: dark ? QCColors.light : QCColors.dark,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(QCSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                  QCSizes.cardRadiusMd,
                                ),
                              ),
                            ),
                            child: SizedBox(
                              height: QCSizes.iconLg * 1.2,
                              width: QCSizes.iconLg * 1.2,
                              child: Center(
                                child: Icon(
                                  Iconsax.add,
                                  color: dark ? QCColors.dark : QCColors.light,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
