import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/layout/grid_layout.dart';
import 'package:quicks_cart/common/widgets/products/product_card/product_card_verticle.dart';
import 'package:quicks_cart/common/widgets/text/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class QCCategoryTab extends StatelessWidget {
  const QCCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(QCSizes.md),
          child: Column(
            children: [
              /// --brands
              QCBrandShowCase(
                images: [
                  QCImages.productImage1,
                  QCImages.productImage2,
                  QCImages.productImage3,
                ],
              ),
              QCBrandShowCase(
                images: [
                  QCImages.productImage1,
                  QCImages.productImage2,
                  QCImages.productImage3,
                ],
              ),

              QCSectionHeadings(title: "You might like", onPressed: () {}),
              SizedBox(height: QCSizes.md),
              QCGridLayout(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return QCProductCardVerticle();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
