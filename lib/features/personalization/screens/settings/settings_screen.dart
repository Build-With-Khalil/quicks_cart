import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/app_bar/qc_app_bar.dart';
import '../../../../common/widgets/custom_shapes/primary_header_container.dart';
import '../../../../common/widgets/list_tile/setting_menu_tile.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/cart/cart_screen.dart';
import '../../../shop/screens/order/order_screen.dart';
import '../address/address_screen.dart';
import '../profile/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            QCPrimaryHeaderContainer(
              height: 180,
              child: Column(
                children: [
                  /// -- AppBar
                  QCAppBar(
                    title: Text(
                      "Accounts",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: QCColors.white),
                    ),
                  ),

                  /// -- User Profile Card
                  QCUserProfileCard(
                    onPressed: () => Get.to(() => ProfileScreen()),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: QCSizes.md),
              child: Column(
                children: [
                  QCSectionHeadings(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  SizedBox(height: QCSizes.sm),
                  QCSettingMenuTile(
                    title: "My Addresses",
                    subtitle: "Set Shopping delivery addresses",
                    icon: Iconsax.safe_home,
                    onTap: () => Get.to(() => UserAddressScreen()),
                  ),
                  QCSettingMenuTile(
                    title: "My Cart",
                    subtitle: "Add, remove Products and move to checkout",
                    icon: Iconsax.shopping_cart,
                    onTap: () => Get.to(() => CartScreen()),
                  ),
                  QCSettingMenuTile(
                    title: "My Orders",
                    subtitle: "In-progress and completed orders",
                    icon: Iconsax.shopping_bag,
                    onTap: () => Get.to(() => OrderScreen()),
                  ),
                  QCSettingMenuTile(
                    title: "Bank Account",
                    subtitle: "Withdraw balance to registered bank account",
                    icon: Iconsax.bank,
                    onTap: () {},
                  ),
                  QCSettingMenuTile(
                    title: "My Coupons",
                    subtitle: "List of all the discounted coupons",
                    icon: Iconsax.discount_shape,
                    onTap: () {},
                  ),
                  QCSettingMenuTile(
                    title: "Notifications",
                    subtitle: "Set any kind of notification message",
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  QCSettingMenuTile(
                    title: "Account Privacy",
                    subtitle: "Manage data usage and connected accounts",
                    icon: Iconsax.security_card,
                    onTap: () {},
                  ),

                  ///-- App Settings
                  SizedBox(height: QCSizes.sm),
                  QCSectionHeadings(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  QCSettingMenuTile(
                    title: "Load Data",
                    subtitle: "Upload data to your Cloud Firebase",
                    icon: Iconsax.document_upload,
                    onTap: () {},
                  ),
                  QCSettingMenuTile(
                    title: "Location",
                    subtitle: "Set recommended based on location",
                    icon: Iconsax.location,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  QCSettingMenuTile(
                    title: "Safe Mode",
                    subtitle: "Search result is safe for all ages",
                    icon: Iconsax.security_user,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  QCSettingMenuTile(
                    title: "HD Image Quality",
                    subtitle: "Set image equality to be seen",
                    icon: Iconsax.image,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SizedBox(height: QCSizes.sm),

                  /// -- Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("Logout"),
                    ),
                  ),
                  SizedBox(height: QCSizes.lg),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
