import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class QCElevatedButtonTheme {
  QCElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: QCColors.light,
      backgroundColor: QCColors.primary,
      disabledForegroundColor: QCColors.darkGrey,
      disabledBackgroundColor: QCColors.buttonDisabled,
      side: const BorderSide(
        color: QCColors.primary,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: QCSizes.buttonHeight,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: QCColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(QCSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: QCColors.light,
      backgroundColor: QCColors.primary,
      disabledForegroundColor: QCColors.darkGrey,
      disabledBackgroundColor: QCColors.darkerGrey,
      side: const BorderSide(
        color: QCColors.primary,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: QCSizes.buttonHeight,
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        color: QCColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(QCSizes.buttonRadius),
      ),
    ),
  );
}
