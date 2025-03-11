import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/features/authentication/controllers/On_Boarding/on_boarding_controller.dart';
import 'package:quicks_cart/utils/constants/text_strings.dart';

import '../../../../../utils/constants/sizes.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      right: QCSizes.defaultSpace,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Show Skip button only on page 0 or 1
            controller.currentPageIndex.value < 2
                ? TextButton(
                  onPressed: controller.skipPage,
                  child: Text(
                    QCTexts.skip,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
                : TextButton(
                  onPressed: controller.nextPage,
                  child: Text(
                    QCTexts.next,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
