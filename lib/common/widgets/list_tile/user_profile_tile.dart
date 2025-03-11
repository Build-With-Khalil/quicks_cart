import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quicks_cart/utils/constants/colors.dart';

import '../../../utils/constants/image_strings.dart';
import '../images/rounded_image.dart';

class QCUserProfileCard extends StatelessWidget {
  const QCUserProfileCard({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: QCRoundedImage(
        imageURL: QCImages.user,
        height: 50,
        width: 50,
        borderRadius: 50,
        padding: EdgeInsets.zero,
      ),
      title: Text(
        "M.Khalil Ur Rehman",
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: QCColors.white),
      ),
      subtitle: Text(
        "muhammad.khalil.dev@gmail.com",
        style: Theme.of(
          context,
        ).textTheme.labelSmall!.apply(color: QCColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(Iconsax.edit, color: QCColors.white),
      ),
    );
  }
}
