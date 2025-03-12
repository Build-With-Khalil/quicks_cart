import 'package:flutter/material.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';

class QCShimmerEffect extends StatelessWidget {
  const QCShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey.shade800 : Colors.grey.shade300,
      highlightColor: dark ? Colors.grey.shade700 : Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? QCColors.darkerGrey : Colors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
