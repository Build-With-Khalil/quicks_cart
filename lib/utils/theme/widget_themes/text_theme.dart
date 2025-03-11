import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class QCTextTheme {
  QCTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.oxygen(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: QCColors.dark,
    ),
    headlineMedium: GoogleFonts.oxygen(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: QCColors.dark,
    ),
    headlineSmall: GoogleFonts.oxygen(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: QCColors.dark,
    ),
    titleLarge: GoogleFonts.oxygen(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: QCColors.dark,
    ),
    titleMedium: GoogleFonts.oxygen(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: QCColors.dark,
    ),
    titleSmall: GoogleFonts.oxygen(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: QCColors.dark,
    ),
    bodyLarge: GoogleFonts.oxygen(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: QCColors.dark,
    ),
    bodyMedium: GoogleFonts.oxygen(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: QCColors.dark,
    ),
    bodySmall: GoogleFonts.oxygen(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: QCColors.dark.withOpacity(0.5),
    ),
    labelLarge: GoogleFonts.oxygen(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: QCColors.dark,
    ),
    labelMedium: GoogleFonts.oxygen(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: QCColors.dark.withOpacity(0.5),
    ),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.oxygen(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: QCColors.light,
    ),
    headlineMedium: GoogleFonts.oxygen(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: QCColors.light,
    ),
    headlineSmall: GoogleFonts.oxygen(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: QCColors.light,
    ),
    titleLarge: GoogleFonts.oxygen(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: QCColors.light,
    ),
    titleMedium: GoogleFonts.oxygen(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: QCColors.light,
    ),
    titleSmall: GoogleFonts.oxygen(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: QCColors.light,
    ),
    bodyLarge: GoogleFonts.oxygen(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: QCColors.light,
    ),
    bodyMedium: GoogleFonts.oxygen(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: QCColors.light,
    ),
    bodySmall: GoogleFonts.oxygen(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: QCColors.light.withOpacity(0.5),
    ),
    labelLarge: GoogleFonts.oxygen(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: QCColors.light,
    ),
    labelMedium: GoogleFonts.oxygen(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: QCColors.light.withOpacity(0.5),
    ),
  );
}
