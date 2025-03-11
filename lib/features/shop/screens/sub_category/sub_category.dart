import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/common/widgets/images/rounded_image.dart';
import 'package:quicks_cart/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:quicks_cart/common/widgets/text/section_heading.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QCAppBar(showBackArrow: true, title: Text("Sports")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(QCSizes.md),
        child: Column(
          children: [
            /// Banners
            QCRoundedImage(
              width: double.infinity,
              imageURL: QCImages.promoBanner1,
              height: null,
              applyImageRadius: true,
            ),
            SizedBox(height: QCSizes.spaceBtwSections),

            /// Sub Categories
            Column(
              children: [
                /// Headings
                QCSectionHeadings(title: "Sports Shirt", onPressed: () {}),
                SizedBox(
                  height: 122,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) => QCProductCardHorizontal(),
                    separatorBuilder:
                        (context, index) => SizedBox(width: QCSizes.sm),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
