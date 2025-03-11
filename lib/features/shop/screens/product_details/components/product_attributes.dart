import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/chips/choice_chips.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';
import 'package:quicks_cart/common/widgets/text/product_title_text.dart';
import 'package:quicks_cart/common/widgets/text/section_heading.dart';
import 'package:quicks_cart/utils/constants/colors.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class QCProductAttributes extends StatelessWidget {
  const QCProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attributes Pricing & Description
        QCCircularContainer(
          padding: EdgeInsets.all(QCSizes.md),
          backgroundColor: dark ? QCColors.darkerGrey : QCColors.grey,
          child: Column(
            children: [
              /// Title Price & Stock Status
              Row(
                children: [
                  QCSectionHeadings(
                    title: "Variations",
                    textColor: dark ? QCColors.white : QCColors.black,
                    showActionButton: false,
                  ),
                  SizedBox(width: QCSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          QCProductTitleText(
                            title: "Price  : ",
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text(
                            "\$250",
                            style: Theme.of(context).textTheme.bodyMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: QCSizes.sm),

                          /// Sale Price
                          QCProductPriceText(price: "175"),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          QCProductTitleText(
                            title: "Stock : ",
                            smallSize: true,
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              QCProductTitleText(
                title:
                    "This is the description of the product  and it can go up to max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        SizedBox(height: QCSizes.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QCSectionHeadings(title: "Colors", showActionButton: false),
            Wrap(
              spacing: 8,
              children: [
                QCChoiceChips(
                  text: "Green",
                  selected: true,
                  onSelected: (value) {},
                ),
                QCChoiceChips(
                  text: "Yellow",
                  selected: false,
                  onSelected: (value) {},
                ),
                QCChoiceChips(
                  text: "Blue",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),

        /// Sizes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QCSectionHeadings(title: "Size", showActionButton: false),
            Wrap(
              spacing: 8,
              children: [
                QCChoiceChips(
                  text: "EU 34",
                  selected: true,
                  onSelected: (value) {},
                ),
                QCChoiceChips(
                  text: "EU 36",
                  selected: false,
                  onSelected: (value) {},
                ),
                QCChoiceChips(
                  text: "EU 38",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
