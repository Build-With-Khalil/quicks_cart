import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quicks_cart/utils/theme/widget_themes/appbar_theme.dart';
import 'package:quicks_cart/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:quicks_cart/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:quicks_cart/utils/theme/widget_themes/chip_theme.dart';
import 'package:quicks_cart/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:quicks_cart/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:quicks_cart/utils/theme/widget_themes/text_field_theme.dart';
import 'package:quicks_cart/utils/theme/widget_themes/text_theme.dart';

import '../constants/colors.dart';

class QCAppTheme {
  QCAppTheme._();

  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    useMaterial3: true,
    disabledColor: QCColors.grey,
    brightness: Brightness.light,
    primaryColor: QCColors.primary,
    textTheme: QCTextTheme.lightTextTheme,
    chipTheme: QCChipTheme.lightChipTheme,
    scaffoldBackgroundColor: QCColors.white,
    appBarTheme: QCAppBarTheme.lightAppBarTheme,
    checkboxTheme: QCCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: QCBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: QCElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: QCOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: QCTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.oxygen().fontFamily,
    useMaterial3: true,
    disabledColor: QCColors.grey,
    brightness: Brightness.dark,
    primaryColor: QCColors.primary,
    textTheme: QCTextTheme.darkTextTheme,
    chipTheme: QCChipTheme.darkChipTheme,
    scaffoldBackgroundColor: QCColors.black,
    appBarTheme: QCAppBarTheme.darkAppBarTheme,
    checkboxTheme: QCCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: QCBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: QCElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: QCOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: QCTextFormFieldTheme.darkInputDecorationTheme,
  );
}
