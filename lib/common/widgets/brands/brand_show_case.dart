import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/brands/brand_card.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class QCBrandShowCase extends StatelessWidget {
  const QCBrandShowCase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return QCCircularContainer(
      showBorder: true,
      borderColor: QCColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(QCSizes.sm),
      margin: EdgeInsets.only(bottom: QCSizes.md),
      child: Column(
        children: [
          QCBrandCard(showBorder: false),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                images
                    .map((e) => brandTopProductImageWidget(e, context))
                    .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String images, context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Expanded(
      child: QCCircularContainer(
        height: 100,
        backgroundColor: dark ? QCColors.darkerGrey : QCColors.light,
        margin: EdgeInsets.only(right: QCSizes.md),
        padding: EdgeInsets.all(QCSizes.sm),
        child: Image(image: AssetImage(images), fit: BoxFit.contain),
      ),
    );
  }
}
