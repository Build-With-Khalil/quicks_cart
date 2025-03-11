import 'package:flutter/material.dart';
import 'package:quicks_cart/features/shop/screens/order/components/orders_list.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

import '../../../../common/widgets/app_bar/qc_app_bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QCAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(QCSizes.sm),
        child: QCOrderListItem(),
      ),
    );
  }
}
