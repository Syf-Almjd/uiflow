import 'package:flutter/material.dart';
import '../config/utils/styles/app_colors.dart';
import '../config/utils/styles/app_textstyles.dart';

/// Custom badge widget for notifications and counts
class AppBadge extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? size;
  final bool showZero;

  const AppBadge({
    super.key,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.size,
    this.showZero = false,
  });

  factory AppBadge.count({
    required int count,
    Color? backgroundColor,
    Color? textColor,
    double? size,
    bool showZero = false,
  }) {
    return AppBadge(
      text: count > 99 ? '99+' : count.toString(),
      backgroundColor: backgroundColor,
      textColor: textColor,
      size: size,
      showZero: showZero,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!showZero && (text == '0' || text.isEmpty)) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size ?? 8,
        vertical: (size ?? 8) / 2,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.redColor,
        borderRadius: BorderRadius.circular((size ?? 16) / 2),
      ),
      constraints: BoxConstraints(
        minWidth: size ?? 20,
        minHeight: size ?? 20,
      ),
      child: Text(
        text,
        style: getBoldStyle(
          color: textColor ?? AppColors.white,
          fontSize: (size ?? 16) * 0.65,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Custom chip widget
class AppChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool selected;

  const AppChip({
    super.key,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.onTap,
    this.onDelete,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? (backgroundColor ?? AppColors.primaryColor)
              : (backgroundColor ?? AppColors.grey).withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? (backgroundColor ?? AppColors.primaryColor)
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 16,
                color: selected
                    ? (textColor ?? AppColors.white)
                    : (textColor ?? AppColors.darkColor),
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: getMediumStyle(
                color: selected
                    ? (textColor ?? AppColors.white)
                    : (textColor ?? AppColors.darkColor),
                fontSize: 14,
              ),
            ),
            if (onDelete != null) ...[
              const SizedBox(width: 4),
              InkWell(
                onTap: onDelete,
                child: Icon(
                  Icons.close,
                  size: 16,
                  color: selected
                      ? (textColor ?? AppColors.white)
                      : (textColor ?? AppColors.darkColor),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Custom card widget with elevation and styling
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final double? elevation;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Border? border;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.elevation,
    this.onTap,
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 2,
      color: backgroundColor ?? AppColors.white,
      margin: margin ?? const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        side: border != null
            ? border!.top
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

/// Avatar widget with fallback
class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? name;
  final double size;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;

  const AppAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.size = 40,
    this.backgroundColor,
    this.textColor,
    this.onTap,
  });

  String _getInitials() {
    if (name == null || name!.isEmpty) return '?';
    
    final parts = name!.trim().split(' ');
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.primaryColor,
          shape: BoxShape.circle,
          image: imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imageUrl == null
            ? Center(
                child: Text(
                  _getInitials(),
                  style: getBoldStyle(
                    color: textColor ?? AppColors.white,
                    fontSize: size * 0.4,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}

/// Divider with text
class AppDivider extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  const AppDivider({
    super.key,
    this.text,
    this.color,
    this.thickness,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return Divider(
        color: color ?? AppColors.grey,
        thickness: thickness ?? 1,
        indent: indent,
        endIndent: endIndent,
      );
    }

    return Row(
      children: [
        if (indent != null) SizedBox(width: indent),
        Expanded(
          child: Divider(
            color: color ?? AppColors.grey,
            thickness: thickness ?? 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            text!,
            style: getRegularStyle(
              color: color ?? AppColors.grey,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: color ?? AppColors.grey,
            thickness: thickness ?? 1,
          ),
        ),
        if (endIndent != null) SizedBox(width: endIndent),
      ],
    );
  }
}

/// Empty state widget
class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: AppColors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: getBoldStyle(
                fontSize: 20,
                color: AppColors.darkColor,
              ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message!,
                style: getRegularStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onAction,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  actionLabel!,
                  style: getMediumStyle(color: AppColors.white),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Progress indicator with label
class AppProgress extends StatelessWidget {
  final double value;
  final String? label;
  final Color? backgroundColor;
  final Color? valueColor;
  final double? height;
  final bool showPercentage;

  const AppProgress({
    super.key,
    required this.value,
    this.label,
    this.backgroundColor,
    this.valueColor,
    this.height,
    this.showPercentage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null || showPercentage)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (label != null)
                  Text(
                    label!,
                    style: getMediumStyle(color: AppColors.darkColor),
                  ),
                if (showPercentage)
                  Text(
                    '${(value * 100).toInt()}%',
                    style: getBoldStyle(
                      color: valueColor ?? AppColors.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular((height ?? 8) / 2),
          child: LinearProgressIndicator(
            value: value.clamp(0.0, 1.0),
            backgroundColor: backgroundColor ?? AppColors.grey.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation(
              valueColor ?? AppColors.primaryColor,
            ),
            minHeight: height ?? 8,
          ),
        ),
      ],
    );
  }
}
