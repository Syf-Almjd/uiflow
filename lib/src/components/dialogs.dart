import 'package:flutter/material.dart';
import '../config/utils/styles/app_colors.dart';
import '../config/utils/styles/app_textstyles.dart';

/// Professional dialog helpers for common use cases
class AppDialogs {
  /// Shows a confirmation dialog
  static Future<bool?> showConfirmation(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color? confirmColor,
    Color? cancelColor,
    IconData? icon,
    bool isDangerous = false,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: isDangerous ? AppColors.redColor : AppColors.primaryColor,
              ),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                title,
                style: getBoldStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: getRegularStyle(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              cancelText,
              style: getMediumStyle(
                color: cancelColor ?? AppColors.grey,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: isDangerous
                  ? AppColors.redColor
                  : (confirmColor ?? AppColors.primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              confirmText,
              style: getMediumStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Shows an information dialog
  static Future<void> showInfo(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = 'OK',
    IconData? icon,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.primaryColor),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                title,
                style: getBoldStyle(fontSize: 18),
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: getRegularStyle(),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: getMediumStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Shows an error dialog
  static Future<void> showError(
    BuildContext context, {
    String title = 'Error',
    required String message,
    String buttonText = 'OK',
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(Icons.error_outline, color: AppColors.redColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: getBoldStyle(fontSize: 18, color: AppColors.redColor),
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: getRegularStyle(),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.redColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: getMediumStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Shows a success dialog
  static Future<void> showSuccess(
    BuildContext context, {
    String title = 'Success',
    required String message,
    String buttonText = 'OK',
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: AppColors.greenColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: getBoldStyle(fontSize: 18, color: AppColors.greenColor),
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: getRegularStyle(),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.greenColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonText,
              style: getMediumStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Shows a custom dialog with a widget
  static Future<T?> showCustom<T>(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
  }) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      ),
    );
  }

  /// Shows a bottom sheet dialog
  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  }) async {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => child,
    );
  }

  /// Shows an input dialog
  static Future<String?> showInput(
    BuildContext context, {
    required String title,
    String? message,
    String? initialValue,
    String? hintText,
    String confirmText = 'Submit',
    String cancelText = 'Cancel',
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) async {
    final controller = TextEditingController(text: initialValue);
    final formKey = GlobalKey<FormState>();

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          title,
          style: getBoldStyle(fontSize: 18),
        ),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message != null) ...[
                Text(
                  message,
                  style: getRegularStyle(),
                ),
                const SizedBox(height: 16),
              ],
              TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                validator: validator,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              cancelText,
              style: getMediumStyle(color: AppColors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                Navigator.of(context).pop(controller.text);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              confirmText,
              style: getMediumStyle(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  /// Shows a selection dialog
  static Future<T?> showSelection<T>(
    BuildContext context, {
    required String title,
    required List<T> items,
    required String Function(T) itemBuilder,
    T? initialSelection,
  }) async {
    return showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          title,
          style: getBoldStyle(fontSize: 18),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isSelected = item == initialSelection;
              
              return ListTile(
                title: Text(
                  itemBuilder(item),
                  style: isSelected
                      ? getBoldStyle(color: AppColors.primaryColor)
                      : getRegularStyle(),
                ),
                trailing: isSelected
                    ? const Icon(Icons.check, color: AppColors.primaryColor)
                    : null,
                onTap: () => Navigator.of(context).pop(item),
              );
            },
          ),
        ),
      ),
    );
  }
}
