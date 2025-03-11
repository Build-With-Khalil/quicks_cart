import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/icon/circular_icon.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class QCBottomAddToCartWidget extends StatelessWidget {
  const QCBottomAddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: QCSizes.sm,
        vertical: QCSizes.sm,
      ),
      decoration: BoxDecoration(
        color: dark ? QCColors.darkerGrey : QCColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(QCSizes.cardRadiusLg),
          topRight: Radius.circular(QCSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              QCCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: dark ? QCColors.white : QCColors.dark,
                width: 40,
                height: 40,
                color: dark ? QCColors.dark : QCColors.white,
                onPressed: () {},
              ),
              SizedBox(width: QCSizes.md),
              Text('1', style: Theme.of(context).textTheme.titleSmall),
              SizedBox(width: QCSizes.md),
              QCCircularIcon(
                icon: Iconsax.add,
                backgroundColor: dark ? QCColors.white : QCColors.dark,
                width: 40,
                height: 40,
                color: dark ? QCColors.dark : QCColors.white,
                onPressed: () {},
              ),
              SizedBox(width: QCSizes.md),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(QCSizes.md),
              backgroundColor: dark ? QCColors.white : QCColors.dark,
              side: BorderSide(color: dark ? QCColors.white : QCColors.dark),
            ),
            child: Text(
              "Add to Cart",
              style: TextStyle(color: dark ? QCColors.dark : QCColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
