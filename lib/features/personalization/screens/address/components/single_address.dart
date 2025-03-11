import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';
import 'package:quicks_cart/utils/constants/colors.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

class QCSingleAddress extends StatelessWidget {
  const QCSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return QCCircularContainer(
      padding: EdgeInsets.all(QCSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor:
          selectedAddress
              ? QCColors.primary.withOpacity(0.5)
              : Colors.transparent,
      borderColor:
          selectedAddress
              ? Colors.transparent
              : dark
              ? QCColors.darkerGrey
              : QCColors.grey,
      margin: EdgeInsets.only(bottom: QCSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color:
                  selectedAddress
                      ? dark
                          ? QCColors.light
                          : QCColors.dark.withOpacity(0.5)
                      : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Muhammad Ali",
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: QCSizes.sm / 2),
              Text(
                "(+92) 311 2764 610",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: QCSizes.sm / 2),
              Text(
                "Jamia Masjid Bait-Ul-Mukaram Street# 2, Sector# B, Akhter Colony, Korangi Road, Karachi, Pakistan",
                softWrap: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
