import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/common/widgets/images/rounded_image.dart';
import 'package:quicks_cart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:quicks_cart/common/widgets/text/section_heading.dart';
import 'package:quicks_cart/features/personalization/screens/profile/components/change_name.dart';
import 'package:quicks_cart/features/personalization/screens/profile/components/profile_menu.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';
import '../../controller/user/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: QCAppBar(title: Text("Profile"), showBackArrow: true),

      /// -- body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(QCSizes.md),
          child: Column(
            children: [
              /// -- Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty
                              ? networkImage
                              : QCImages.user;
                      return controller.profileLoading.value
                          ? QCShimmerEffect(width: 80, height: 80, radius: 80)
                          : ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: QCRoundedImage(
                              imageURL: image,
                              borderRadius: 80,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              isNetworkImage: networkImage.isNotEmpty,
                            ),
                          );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: Text(
                        "Change Profile Picture",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: QCSizes.sm),

              /// --Details
              Divider(),
              SizedBox(height: QCSizes.sm),

              /// -- Heading Profile Info
              QCSectionHeadings(
                title: "Profile Information",
                showActionButton: false,
              ),

              QCProfileMenu(
                onTap: () => Get.to(() => ChangeName()),
                title: "Name",
                value: controller.user.value.fullName,
              ),
              QCProfileMenu(
                onTap: () {},
                title: "UserName",
                value: controller.user.value.userName,
              ),

              Divider(),
              SizedBox(height: QCSizes.sm),

              /// -- Heading Profile Info
              QCSectionHeadings(
                title: "Personal Information",
                showActionButton: false,
              ),

              QCProfileMenu(
                onTap: () {},
                title: "User ID",
                value: controller.user.value.id,
              ),
              QCProfileMenu(
                onTap: () {},
                title: "E-Mail",
                value: controller.user.value.email,
              ),
              QCProfileMenu(
                onTap: () {},
                title: "Phone Number",
                value: controller.user.value.phoneNumber,
              ),
              QCProfileMenu(onTap: () {}, title: "Gender", value: "Male"),
              QCProfileMenu(
                onTap: () {},
                title: "Date of Birth",
                value: "20 Jan, 2002",
              ),
              Divider(),
              SizedBox(height: QCSizes.md),
              TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: Text(
                  "Close Account",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
