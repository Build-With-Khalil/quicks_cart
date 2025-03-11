import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/text/section_heading.dart';
import 'package:quicks_cart/features/shop/screens/product_details/components/bottom_add_to_cart_widget.dart';
import 'package:quicks_cart/features/shop/screens/product_details/components/product_attributes.dart';
import 'package:quicks_cart/features/shop/screens/product_details/components/product_image_slider.dart';
import 'package:quicks_cart/features/shop/screens/product_details/components/product_meta_data.dart';
import 'package:quicks_cart/features/shop/screens/product_details/components/rating_and_share.dart';
import 'package:quicks_cart/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: QCBottomAddToCartWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1- Product Image Slider
            QCProductImageSlider(),

            /// 2- Product Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: QCSizes.md),
              child: Column(
                children: [
                  /// -Rating & Share
                  QCRatingAndShare(),

                  /// -Price, Title, Stock, Brand
                  ProductMetaData(),

                  /// -- Attributes
                  QCProductAttributes(),
                  SizedBox(height: QCSizes.md),

                  /// -- Checkout Buttons
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("CheckOut"),
                    ),
                  ),
                  SizedBox(height: QCSizes.md),

                  /// -- Description
                  QCSectionHeadings(
                    title: "Description",
                    showActionButton: false,
                  ),
                  SizedBox(height: QCSizes.sm),
                  ReadMoreText(
                    "Mobile technology is advancing rapidly, changing how we connect and interact. Every year, new features and apps are introduced to make our lives easier. Smartphones have become essential for both personal and professional use. People rely on mobile apps for entertainment, shopping, and managing finances. Developers work tirelessly to create user-friendly interfaces and unique experiences. Security and privacy remain top priorities as more personal data is shared on devices. Mobile payments are now a standard, simplifying transactions everywhere. Companies invest in mobile apps to enhance customer engagement and loyalty. The future of mobile technology promises even more innovation and convenience. As devices evolve, so will our relationship with them, shaping the way we live and work.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: "Show less",
                    moreStyle: TextStyle(
                      color: dark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                    lessStyle: TextStyle(
                      color: dark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: QCSizes.md),

                  /// -- Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QCSectionHeadings(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed:
                            () => Get.to(() => ProductRatingAndReviewsScreen()),
                        icon: Icon(Iconsax.arrow_right_3),
                      ),
                    ],
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
