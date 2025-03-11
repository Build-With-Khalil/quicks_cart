import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/app_bar/qc_app_bar.dart';
import 'package:quicks_cart/common/widgets/images/rounded_image.dart';
import 'package:quicks_cart/common/widgets/text/section_heading.dart';
import 'package:quicks_cart/features/personalization/screens/profile/components/profile_menu.dart';
import 'package:quicks_cart/utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    QCRoundedImage(imageURL: QCImages.user, borderRadius: 50),
                    TextButton(
                      onPressed: () {},
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
                onTap: () {},
                title: "Name",
                value: "M.Khalil Ur Rehman",
              ),
              QCProfileMenu(
                onTap: () {},
                title: "UserName",
                value: "muhammadkhalil",
              ),

              Divider(),
              SizedBox(height: QCSizes.sm),

              /// -- Heading Profile Info
              QCSectionHeadings(
                title: "Personal Information",
                showActionButton: false,
              ),

              QCProfileMenu(onTap: () {}, title: "User ID", value: "89733"),
              QCProfileMenu(
                onTap: () {},
                title: "E-Mail",
                value: "muhammad.khalil.dev@gmail.com",
              ),
              QCProfileMenu(
                onTap: () {},
                title: "Phone Number",
                value: "+92-311-2764610",
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
                onPressed: () {},
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
