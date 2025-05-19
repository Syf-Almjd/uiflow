import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/utils/styles/app_colors.dart';

/// Returns a TextStyle using the Almarai font.
///
/// Parameters:
/// - [size]: Font size.
/// - [textColor]: Color of the text.
/// - [fontWeight]: FontWeight of the text.
TextStyle fontAlmarai({
  double? size,
  Color? textColor,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.almarai(
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: size ?? 16,
    color: textColor ?? AppColors.blackDark,
  );
}

/// Returns a TextStyle using the Lobster font.
///
/// Parameters:
/// - [size]: Font size.
/// - [textColor]: Color of the text.
/// - [fontWeight]: FontWeight of the text.
TextStyle fontLobster({
  double? size,
  Color? textColor,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.lobster(
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: size ?? 16,
    color: textColor ?? AppColors.blackDark,
  );
}

/// Returns a TextStyle using the El Messiri font.
///
/// Parameters:
/// - [size]: Font size.
/// - [textColor]: Color of the text.
/// - [fontWeight]: FontWeight of the text.
TextStyle fontElMessiri({
  double? size,
  Color? textColor,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.elMessiri(
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: size ?? 16,
    color: textColor ?? AppColors.blackDark,
  );
}

/// Returns a TextStyle using the Poppins font.
///
/// Parameters:
/// - [size]: Font size.
/// - [textColor]: Color of the text.
/// - [fontWeight]: FontWeight of the text.
TextStyle fontPoppins({
  double? size,
  Color? textColor,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.poppins(
    fontWeight: fontWeight ?? FontWeight.bold,
    fontSize: size ?? 16,
    color: textColor ?? AppColors.blackDark,
  );
}
