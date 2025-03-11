import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/circular_container.dart';

class QCCoponCode extends StatelessWidget {
  const QCCoponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QCCircularContainer(
      showBorder: true,
      backgroundColor: QCHelperFunctions.isDarkMode(context)
          ? QCColors.dark
          : QCColors.white,
      padding: EdgeInsets.symmetric(
        horizontal: QCSizes.md,
        vertical: QCSizes.sm,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Coupon Code",
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: QCHelperFunctions.isDarkMode(context)
                    ? QCColors.white.withOpacity(0.5)
                    : QCColors.dark.withOpacity(0.5),
                backgroundColor: QCColors.grey.withOpacity(0.2),
                side: BorderSide(color: QCColors.grey.withOpacity(0.1)),
              ),
              onPressed: () {},
              child: Text("Apply"),
            ),
          )
        ],
      ),
    );
  }
}
