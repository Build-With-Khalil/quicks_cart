import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class QCSearchContainer extends StatelessWidget {
  const QCSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackGround = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.symmetric(horizontal: QCSizes.sm),
  });

  final String text;
  final IconData? icon;
  final bool showBackGround, showBorder;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: Container(
        width: QCDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(QCSizes.md),
        decoration: BoxDecoration(
          color: showBackGround
              ? dark
                  ? QCColors.dark
                  : QCColors.light
              : Colors.transparent,
          borderRadius: BorderRadius.circular(QCSizes.cardRadiusLg),
          border: showBorder
              ? Border.all(
                  color: QCColors.grey,
                )
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: QCColors.darkerGrey,
            ),
            SizedBox(
              width: QCSizes.spaceBtwItems,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
