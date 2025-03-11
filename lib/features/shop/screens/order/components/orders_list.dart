import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';

class QCOrderListItem extends StatelessWidget {
  const QCOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 6,
      itemBuilder: (context, index) => QCCircularContainer(
        showBorder: true,
        backgroundColor: dark ? QCColors.dark : QCColors.light,
        padding: EdgeInsets.all(QCSizes.sm),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// --Row 1
            Row(
              children: [
                /// 1 - Icon
                Icon(Iconsax.ship),
                SizedBox(
                  width: QCSizes.sm,
                ),

                /// 2 - Status & Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: QCColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text(
                        "04 Dec, 2024",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                ),

                /// 3 - Icon
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.arrow_right_34,
                    size: QCSizes.iconSm,
                  ),
                )
              ],
            ),
            SizedBox(
              height: QCSizes.sm,
            ),

            /// --Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      Icon(Iconsax.tag),
                      SizedBox(
                        width: QCSizes.sm,
                      ),

                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "[#256f2]",
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// 1 - Icon
                      Icon(Iconsax.calendar),
                      SizedBox(
                        width: QCSizes.sm,
                      ),

                      /// 2 - Status & Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shipping Date",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              "20 jan, 2025",
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
    );
  }
}
