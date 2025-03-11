import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/common/widgets/icon/circular_icon.dart';
import 'package:quicks_cart/common/widgets/layout/grid_layout.dart';
import 'package:quicks_cart/common/widgets/products/product_card/product_card_verticle.dart';
import 'package:quicks_cart/features/shop/screens/home/home_screen.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: QCAppBar(
        title: Text(
          "Wish List",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          QCCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(QCSizes.md),
          child: Column(
            children: [
              QCGridLayout(
                itemCount: 7,
                itemBuilder: (context, index) => QCProductCardVerticle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
