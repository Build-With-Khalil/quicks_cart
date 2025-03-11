import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';

import '../../../../utils/constants/sizes.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QCAppBar(title: Text("Popular Product"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(QCSizes.sm), child: Column()),
      ),
    );
  }
}
