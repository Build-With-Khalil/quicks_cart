import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class QCRatingAndShare extends StatelessWidget {
  const QCRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '4.5',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: ' (200)',
                  ),
                ],
              ),
            )
          ],
        ),

        /// Share Button
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            size: QCSizes.iconMd,
          ),
        ),
      ],
    );
  }
}
