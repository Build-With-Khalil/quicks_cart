import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/products/product_card/product_card_verticle.dart';
import 'package:quicks_cart/features/shop/screens/all_product/all_product.dart';
import 'package:quicks_cart/features/shop/screens/home/components/promo_slider.dart';
import 'package:quicks_cart/features/shop/screens/home/components/qc_home_app_bar.dart';
import 'package:quicks_cart/features/shop/screens/sub_category/sub_category.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/search_container.dart';
import '../../../../common/widgets/images/category_image_and_text.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            QCPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- App bar --
                  QCHomeAppBar(),
                  SizedBox(height: QCSizes.spaceBtwItems / 2),

                  /// -- Search Bar --
                  QCSearchContainer(
                    text: 'Search In Store',
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(height: QCSizes.spaceBtwItems / 1.5),

                  /// -- Categories --
                  Padding(
                    padding: EdgeInsets.only(left: QCSizes.md),
                    child: Column(
                      children: [
                        /// -- Section Heading --
                        QCSectionHeadings(
                          title: 'Popular Categories',
                          textColor: QCColors.white,
                          showActionButton: false,
                        ),
                        SizedBox(height: QCSizes.spaceBtwItems / 2),

                        /// -- Categories --
                        SizedBox(
                          height: 90,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return QCCategoryImageAndText(
                                image: QCImages.sportIcon,
                                title: 'Sports',
                                onTap: () => Get.to(() => SubCategoryScreen()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- Body --

            /// -- Banners --
            Padding(
              padding: const EdgeInsets.all(QCSizes.md),
              child: Column(
                children: [
                  QCPromoSlider(
                    banners: [
                      QCImages.promoBanner1,
                      QCImages.promoBanner2,
                      QCImages.promoBanner3,
                    ],
                  ),
                  SizedBox(height: QCSizes.spaceBtwItems / 2),

                  /// -- Popular Products --
                  QCSectionHeadings(
                    title: 'Popular Products',
                    textColor:
                        QCHelperFunctions.isDarkMode(context)
                            ? QCColors.white
                            : QCColors.black,
                    showActionButton: true,
                    onPressed: () => Get.to(() => AllProductScreen()),
                  ),
                  SizedBox(height: QCSizes.spaceBtwItems / 2),

                  /// -- Products --
                  QCGridLayout(
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return QCProductCardVerticle();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
