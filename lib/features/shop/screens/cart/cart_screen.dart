import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/features/shop/screens/cart/components/cart_items.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QCAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(QCSizes.md),
        child: QCCartItems(),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () => Get.to(() => Checkout()),
        child: Text("Checkout \$122"),
      ),
    );
  }
}
