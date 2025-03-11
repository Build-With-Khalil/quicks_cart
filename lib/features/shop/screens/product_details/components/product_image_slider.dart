import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/app_bar/qc_app_bar.dart';
import '../../../../../common/widgets/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icon/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class QCProductImageSlider extends StatelessWidget {
  const QCProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return QCCurvedEdgeWidget(
      child: Container(
        color: dark ? QCColors.darkerGrey : QCColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(QCSizes.md),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      QCImages.productImage5,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: 10,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => SizedBox(
                    width: QCSizes.sm,
                  ),
                  itemBuilder: (_, index) => QCRoundedImage(
                    width: 80,
                    imageURL: QCImages.productImage3,
                    applyImageRadius: true,
                    padding: EdgeInsets.all(2),
                    backgroundColor: dark ? QCColors.dark : QCColors.white,
                  ),
                ),
              ),
            ),
            QCAppBar(
              showBackArrow: true,
              actions: [
                QCCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
