import 'package:flutter/material.dart';
import 'package:quicks_cart/common/widgets/curved_edges/curved_edges_widget.dart';
import 'package:quicks_cart/common/widgets/custom_shapes/circular_container.dart';

import '../../../utils/constants/colors.dart';

class QCPrimaryHeaderContainer extends StatelessWidget {
  const QCPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height = 300,
  });

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return QCCurvedEdgeWidget(
      child: Container(
        height: height,
        color: QCColors.primary,
        padding: EdgeInsets.all(0),
        child: Container(
          color: QCColors.primary,
          child: Stack(
            children: [
              Positioned(
                top: -200,
                right: -250,
                child: QCCircularContainer(
                  height: 400,
                  width: 400,
                  radius: 400,
                  backgroundColor: QCColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 20,
                right: -300,
                child: QCCircularContainer(
                  height: 400,
                  width: 400,
                  radius: 400,
                  backgroundColor: QCColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
