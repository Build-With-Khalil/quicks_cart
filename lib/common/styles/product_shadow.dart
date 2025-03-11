import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class QCProductShadow {
  static final verticleProductShadow = BoxShadow(
    color: QCColors.darkerGrey.withOpacity(0.1),
    offset: Offset(0, 2),
    blurRadius: 50,
    spreadRadius: 7,
  );
  static final horizontalProductShadow = BoxShadow(
    color: QCColors.darkerGrey.withOpacity(0.1),
    offset: Offset(0, 2),
    blurRadius: 50,
    spreadRadius: 7,
  );
}
