import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/rounded_image.dart';
import '../../text/brand_title_with_verified_icon.dart';
import '../../text/product_title_text.dart';

class QCCartItem extends StatelessWidget {
  const QCCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QCRoundedImage(
          imageURL: QCImages.productImage1,
          height: 60,
          width: 60,
          padding: EdgeInsets.all(QCSizes.xs),
          backgroundColor: QCHelperFunctions.isDarkMode(context)
              ? QCColors.darkerGrey
              : QCColors.light,
        ),
        SizedBox(
          width: QCSizes.md,
        ),

        /// Title, Size and Price
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QCBrandTitleWithVerifiedIcon(title: "Nike"),
              Flexible(
                child: QCProductTitleText(
                  title: "Black Sports Shoes ",
                  maxLines: 1,
                ),
              ),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Color: ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "Green",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: " Size: ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "UK 08",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
