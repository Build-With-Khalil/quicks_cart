import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/common/widgets/products/rating/rating_bar_indicator.dart';
import 'package:quicks_cart/features/shop/screens/product_reviews/components/over_all_product_rating.dart';
import 'package:quicks_cart/features/shop/screens/product_reviews/components/user_review_card.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

class ProductRatingAndReviewsScreen extends StatelessWidget {
  const ProductRatingAndReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QCAppBar(title: Text("Reviews & Ratings"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(QCSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you see.",
              ),
              SizedBox(height: QCSizes.md),

              /// Overall Product Ratings
              OverAllProductRating(),
              QCRatingBarIndicator(rating: 3.5),
              Text("12,546", style: Theme.of(context).textTheme.bodySmall),

              /// User Review List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
