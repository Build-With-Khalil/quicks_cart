import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/features/shop/screens/checkout/components/billing_address_section.dart';
import 'package:quicks_cart/features/shop/screens/checkout/components/billing_amount_section.dart';
import 'package:quicks_cart/features/shop/screens/checkout/components/billing_payment_section.dart';

import '../../../../common/widgets/app_bar/qc_app_bar.dart';
import '../../../../common/widgets/custom_shapes/circular_container.dart';
import '../../../../common/widgets/products/carts/copon_widget.dart';
import '../../../../common/widgets/success/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../cart/components/cart_items.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QCAppBar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(QCSizes.md),
        child: Column(
          children: [
            /// Items in cart
            QCCartItems(showAddRemoveButton: false),
            SizedBox(height: QCSizes.md),

            /// Coupon TextField
            QCCoponCode(),
            SizedBox(height: QCSizes.md),

            /// -- Billing Section
            QCCircularContainer(
              showBorder: true,
              backgroundColor:
                  QCHelperFunctions.isDarkMode(context)
                      ? QCColors.black
                      : QCColors.white,
              padding: EdgeInsets.all(QCSizes.sm),
              child: Column(
                children: [
                  /// Pricing
                  QCBillingAmountSection(),
                  SizedBox(height: QCSizes.sm),

                  /// Divider
                  Divider(),
                  SizedBox(height: QCSizes.sm),

                  /// Payment Method
                  QCBillingPaymentSection(),

                  /// Payment Address
                  QCBillingAddressSection(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(QCSizes.md),
        child: ElevatedButton(
          onPressed:
              () => Get.to(
                () => SuccessScreen(
                  image: QCImages.successfulPaymentIcon,
                  title: "Payment Successful",
                  subTitle: "Your item will be shipped soon!",
                  onPressed: () => Get.offAll(() => NavigationMenu()),
                ),
              ),
          child: Text("Checkout \$122"),
        ),
      ),
    );
  }
}
