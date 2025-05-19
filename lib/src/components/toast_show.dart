import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';

/// Displays a toast notification with the specified [text] and [type].
///
/// Parameters:
/// - [text]: The text to be displayed in the toast.
/// - [type]: The type of the snackbar (success, error, info, warning).
/// - [context]: The build context.
void showToast(String text, SnackBarType type, context) => IconSnackBar.show(
      context,
      snackBarType: type,
      label: text,
    );
