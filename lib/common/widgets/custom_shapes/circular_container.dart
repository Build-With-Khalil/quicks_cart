import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class QCCircularContainer extends StatelessWidget {
  const QCCircularContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.radius = QCSizes.cardRadiusLg,
    this.padding,
    this.backgroundColor = QCColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = QCColors.borderPrimary,
  });

  final Widget? child;
  final double? width, height;
  final double radius;
  final EdgeInsets? padding;
  final Color backgroundColor;
  final EdgeInsets? margin;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
