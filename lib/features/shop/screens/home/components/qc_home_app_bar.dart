import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/app_bar/qc_app_bar.dart';
import '../../../../../common/widgets/products/carts/cart_counter_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../cart/cart_screen.dart';

class QCHomeAppBar extends StatelessWidget {
  const QCHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QCAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            QCTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: QCColors.grey),
          ),
          Text(
            QCTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: QCColors.white),
          ),
        ],
      ),
      actions: [
        QCCartCounterIcon(
          onPressed: () => Get.to(() => CartScreen()),
          iconColor: QCColors.white,
        ),
      ],
    );
  }
}
