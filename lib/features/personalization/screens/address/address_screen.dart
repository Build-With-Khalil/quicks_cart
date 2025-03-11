import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/features/personalization/screens/address/add_new_address_screen.dart';
import 'package:quicks_cart/features/personalization/screens/address/components/single_address.dart';
import 'package:quicks_cart/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddNewAddressScreen());
        },
        backgroundColor: QCColors.primary,
        child: Icon(Icons.add, color: QCColors.white),
      ),
      appBar: QCAppBar(
        showBackArrow: true,
        title: Text(
          "Addresses",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(QCSizes.md),
          child: Column(
            children: [
              /// Address List
              QCSingleAddress(selectedAddress: true),
              QCSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
