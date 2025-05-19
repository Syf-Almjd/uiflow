import 'package:flutter/material.dart';
import 'package:uiflow/src/components/reposnsiveness.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../config/utils/styles/app_colors.dart';
import 'fonts.dart';
import 'loading.dart';

/// Custom TextField widget with common styling.
///
/// Used to create a customized text input field.
///
/// Parameters:
/// - [controller]: Controller for the text input.
/// - [hintText]: Hint text displayed in the input field.
/// - [obscureText]: Whether the text should be obscured (e.g., for passwords).
/// - [textAlign]: Text alignment within the input field.
/// - [prefixIcon]: Icon to be displayed before the input text.
/// - [internalPadding]: Padding within the input field.
/// - [onChanged]: Callback function when the text is changed.
/// - [onSubmitted]: Callback function when the user submits the input.
Widget textFieldA({
  Key? key,
  required TextEditingController controller,
  required String hintText,
  bool? obscureText = false,
  TextAlign textAlign = TextAlign.start,
  Icon? prefixIcon,
  double? internalPadding,
  void Function(String)? onChanged,
  void Function(String)? onSubmitted,
}) {
  return TextField(
    key: key,
    controller: controller,
    obscureText: obscureText ?? false,
    cursorColor: HexColor("#4f4f4f"),
    textAlign: textAlign,
    decoration: InputDecoration(
      hintText: hintText,
      fillColor: HexColor("#f2f3ff"),
      contentPadding: EdgeInsets.all(internalPadding ?? 20),
      hintStyle: GoogleFonts.almarai(
        fontSize: 15,
        color: Colors.black87,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      prefixIcon: prefixIcon,
      prefixIconColor: HexColor("#4f4f4f"),
      filled: true,
    ),
    onChanged: onChanged,
    onSubmitted: onSubmitted,
  );
}

/// Custom Button widget with common styling.
///
/// Used to create a customized button.
///
/// Parameters:
/// - [onPressed]: Callback function when the button is pressed.
/// - [buttonText]: Text displayed on the button.
/// - [height]: Height of the button.
/// - [width]: Width of the button.
/// - [color]: Background color of the button.
/// - [borderSize]: Size of the button's border radius.
/// - [textColor]: Color of the button text.
Widget buttonA({
  final Function()? onPressed,
  required final String buttonText,
  int? height,
  int? width,
  Color? color,
  int? borderSize,
  Color? textColor,
}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      height: (height ?? 55).toDouble(),
      width: (height ?? 275).toDouble(),
      decoration: BoxDecoration(
        color: (color ?? HexColor('#ebcd34')),
        borderRadius: BorderRadius.circular(
          (borderSize ?? 17).toDouble(),
        ),
      ),
      child: Center(
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: fontAlmarai(size: 22),
        ),
      ),
    ),
  );
}

/// Loading Button widget with conditional visibility.
///
/// Used to create a button that shows a loading animation when isLoading is true,
/// otherwise, it shows a regular button.
///
/// Parameters:
/// - [buttonHeight]: Height of the button.
/// - [buttonWidth]: Width of the button.
/// - [textColor]: Color of the button text.
/// - [textSize]: Font size of the button text.
/// - [buttonElevation]: Elevation of the button.
/// - [onPressed]: Callback function when the button is pressed.
/// - [buttonText]: Text displayed on the button.
/// - [context]: Build context for calculating default width.
/// - [isLoading]: Flag to determine whether to show loading animation or button.
Widget loadButton({
  double? buttonHeight,
  double? buttonWidth,
  Color? textColor,
  double? textSize,
  double? buttonElevation,
  required Function() onPressed,
  required String buttonText,
  required BuildContext context,
  required bool isLoading,
}) {
  return Visibility(
    visible: !isLoading,
    replacement: Container(
      width: buttonWidth ?? getWidth(80, context),
      height: buttonHeight ?? 60.0,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: FilledButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: buttonElevation ?? 0.0,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: textSize ?? getWidth(10, context),
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    ),
    child: loadingAnimation(
      loadingType: LoadingAnimationWidget.beat(
        color: AppColors.primaryColor,
        size: getWidth(10, context),
      ),
    ),
  );
}
