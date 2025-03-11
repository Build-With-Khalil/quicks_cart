import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/carts/add_remove_button.dart';
import '../../../../../common/widgets/products/carts/cart_item.dart';
import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class QCCartItems extends StatelessWidget {
  const QCCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => SizedBox(
        height: QCSizes.md,
      ),
      itemBuilder: (_, index) {
        return Column(
          children: [
            QCCartItem(),
            if (showAddRemoveButton)
              SizedBox(
                height: QCSizes.sm,
              ),
            if (showAddRemoveButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      QCProductQuantityWithAddAndRemoveButton(),
                    ],
                  ),
                  QCProductPriceText(price: "122"),
                ],
              ),
          ],
        );
      },
    );
  }
}
