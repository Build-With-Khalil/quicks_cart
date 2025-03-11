import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';

class QCProductQuantityWithAddAndRemoveButton extends StatelessWidget {
  const QCProductQuantityWithAddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        QCCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: QCSizes.md,
          backgroundColor: dark ? QCColors.white : QCColors.dark,
          color: dark ? QCColors.dark : QCColors.white,
          onPressed: () {},
        ),
        SizedBox(
          width: QCSizes.md,
        ),
        Text(
          '1',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(
          width: QCSizes.md,
        ),
        QCCircularIcon(
          icon: Iconsax.add,
          backgroundColor: dark ? QCColors.white : QCColors.dark,
          width: 32,
          height: 32,
          size: QCSizes.md,
          color: dark ? QCColors.dark : QCColors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
