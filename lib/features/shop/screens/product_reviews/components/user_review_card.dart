import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';
import 'package:quicks_cart/common/widgets/products/rating/rating_bar_indicator.dart';
import 'package:quicks_cart/utils/constants/colors.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(QCImages.userProfileImage1),
                ),
                SizedBox(width: QCSizes.sm),
                Text("John Doe", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(height: QCSizes.xs),

        /// Reviews
        Row(
          children: [
            QCRatingBarIndicator(rating: 4),
            SizedBox(width: QCSizes.sm),
            Text("15 Nov, 2024", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        ReadMoreText(
          "This is a very good product. I am very happy with the quality of the product. I will recommend this product to everyone.",
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: "show less",
          trimCollapsedText: "show more",
          style: Theme.of(context).textTheme.bodyMedium,
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: QCColors.primary,
          ),
          lessStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: QCColors.primary,
          ),
        ),
        SizedBox(height: QCSizes.md),

        /// Company Review
        QCCircularContainer(
          backgroundColor: dark ? QCColors.darkerGrey : QCColors.grey,
          child: Padding(
            padding: EdgeInsets.all(QCSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Company's Response",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "16 Nov, 2024",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                SizedBox(height: QCSizes.xs),
                ReadMoreText(
                  "This is a very good product. I am very happy with the quality of the product. I will recommend this product to everyone.",
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: "show less",
                  trimCollapsedText: "show more",
                  style: Theme.of(context).textTheme.bodyMedium,
                  moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: QCColors.primary,
                  ),
                  lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: QCColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: QCSizes.md),
      ],
    );
  }
}
