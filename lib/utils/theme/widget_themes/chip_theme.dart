import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class QCChipTheme {
  QCChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: QCColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(
      color: QCColors.black,
    ),
    selectedColor: QCColors.primary,
    padding: const EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12,
    ),
    checkmarkColor: QCColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: QCColors.darkerGrey,
    labelStyle: TextStyle(
      color: QCColors.white,
    ),
    selectedColor: QCColors.primary,
    padding: EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12,
    ),
    checkmarkColor: QCColors.white,
  );
}
