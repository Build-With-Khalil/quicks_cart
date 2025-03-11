import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class QCTextFormFieldTheme {
  QCTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: QCColors.darkGrey,
    suffixIconColor: QCColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: QCSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: QCSizes.fontSizeMd,
      color: QCColors.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: QCSizes.fontSizeSm,
      color: QCColors.black,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: QCColors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: QCColors.grey,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: QCColors.grey,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: QCColors.dark,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: QCColors.warning,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 2,
        color: QCColors.warning,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: QCColors.darkGrey,
    suffixIconColor: QCColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: QCSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: QCSizes.fontSizeMd,
      color: QCColors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: QCSizes.fontSizeSm,
      color: QCColors.white,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: QCColors.white.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: QCColors.darkGrey,
      ),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: QCColors.darkGrey,
      ),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: QCColors.white,
      ),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 1,
        color: QCColors.warning,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(QCSizes.inputFieldRadius),
      borderSide: const BorderSide(
        width: 2,
        color: QCColors.warning,
      ),
    ),
  );
}
