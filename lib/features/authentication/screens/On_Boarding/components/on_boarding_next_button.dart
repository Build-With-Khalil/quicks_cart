import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/utils/constants/colors.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/On_Boarding/on_boarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Positioned(
      right: QCSizes.defaultSpace,
      bottom: QCDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(side: BorderSide.none),
          backgroundColor: dark ? QCColors.light : QCColors.black,
        ),
        child: Icon(
          Iconsax.arrow_right_3,
          color: dark ? QCColors.black : QCColors.light,
        ),
      ),
    );
  }
}
