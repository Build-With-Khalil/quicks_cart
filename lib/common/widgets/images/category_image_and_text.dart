import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class QCCategoryImageAndText extends StatelessWidget {
  const QCCategoryImageAndText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = QCColors.white,
    this.backgroundColor = QCColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: QCSizes.sm),
        child: Column(
          children: [
            /// -- Category Icon --
            Container(
              height: 56,
              width: 56,
              padding: EdgeInsets.all(QCSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? QCColors.dark : QCColors.light),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image(
                  image: AssetImage(
                    image,
                  ),
                  color: dark ? QCColors.dark : QCColors.dark,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: QCSizes.xs,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
