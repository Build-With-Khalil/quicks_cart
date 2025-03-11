import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/text/brand_title_text.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class QCBrandTitleWithVerifiedIcon extends StatelessWidget {
  const QCBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLine = 1,
    this.textColor,
    this.iconColor = QCColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLine,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        SizedBox(width: QCSizes.xs),
        Icon(Iconsax.verify5, color: QCColors.primary, size: QCSizes.iconXs),
      ],
    );
  }
}
