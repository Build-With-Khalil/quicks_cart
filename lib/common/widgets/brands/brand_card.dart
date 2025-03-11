import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/circular_container.dart';
import '../images/circular_images.dart';
import '../text/brand_title_with_verified_icon.dart';

class QCBrandCard extends StatelessWidget {
  const QCBrandCard({
    super.key,
    this.onTap,
    required this.showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: QCCircularContainer(
        radius: 18,
        height: 60,
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        borderColor: dark ? QCColors.darkGrey : QCColors.grey,
        child: Row(
          children: [
            Flexible(
              child: CircularImages(
                isNetworkImage: false,
                image: QCImages.nikeLogo,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? QCColors.light : QCColors.dark,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  QCBrandTitleWithVerifiedIcon(
                    title: "Nike",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 Products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
