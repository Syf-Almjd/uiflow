import 'package:flutter/material.dart';

/// String extensions for common operations
extension StringExtensions on String {
  /// Capitalizes first letter of the string
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalizes first letter of each word
  String capitalizeWords() {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.isEmpty ? word : word.capitalize())
        .join(' ');
  }

  /// Checks if string is a valid email
  bool get isValidEmail {
    return RegExp(
      r'''^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$''',
    ).hasMatch(this);
  }

  /// Checks if string is a valid URL
  bool get isValidUrl {
    return RegExp(
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$',
    ).hasMatch(this);
  }

  /// Checks if string is a valid phone number
  bool get isValidPhone {
    final digitsOnly = replaceAll(RegExp(r'\D'), '');
    return digitsOnly.length >= 10 && digitsOnly.length <= 15;
  }

  /// Checks if string contains only numeric characters
  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  /// Checks if string contains only alphabetic characters
  bool get isAlphabetic {
    return RegExp(r'^[a-zA-Z]+$').hasMatch(this);
  }

  /// Checks if string contains only alphanumeric characters
  bool get isAlphanumeric {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
  }

  /// Truncates string to specified length with ellipsis
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$ellipsis';
  }

  /// Removes all whitespace from string
  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Reverses the string
  String reverse() {
    return split('').reversed.join();
  }

  /// Converts string to slug (URL-friendly)
  String toSlug() {
    return toLowerCase()
        .replaceAll(RegExp(r'[^\w\s-]'), '')
        .replaceAll(RegExp(r'[\s_-]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
  }

  /// Masks email address (e.g., j***@example.com)
  String maskEmail() {
    if (!isValidEmail) return this;
    final parts = split('@');
    final name = parts[0];
    final domain = parts[1];
    
    if (name.length <= 2) {
      return '$name***@$domain';
    }
    
    return '${name[0]}${'*' * (name.length - 1)}@$domain';
  }

  /// Masks phone number (e.g., ***-***-1234)
  String maskPhone({int visibleDigits = 4}) {
    final digitsOnly = replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length < visibleDigits) return this;
    
    final visible = digitsOnly.substring(digitsOnly.length - visibleDigits);
    final masked = '*' * (digitsOnly.length - visibleDigits);
    
    return '$masked$visible';
  }

  /// Converts string to Color
  Color? toColor() {
    try {
      String hexString = this;
      if (hexString.startsWith('#')) {
        hexString = hexString.substring(1);
      }
      if (hexString.length == 6) {
        hexString = 'FF$hexString';
      }
      return Color(int.parse(hexString, radix: 16));
    } catch (e) {
      return null;
    }
  }

  /// Counts words in string
  int get wordCount {
    return trim().split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
  }

  /// Gets file extension
  String? get fileExtension {
    final index = lastIndexOf('.');
    if (index == -1 || index == length - 1) return null;
    return substring(index + 1);
  }
}

/// DateTime extensions
extension DateTimeExtensions on DateTime {
  /// Checks if date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Checks if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Checks if date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Gets time ago string (e.g., "2 hours ago")
  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else {
      return 'just now';
    }
  }

  /// Formats date as "Jan 1, 2024"
  String get formattedDate {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[month - 1]} $day, $year';
  }

  /// Formats time as "3:45 PM"
  String get formattedTime {
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;
    final period = hour >= 12 ? 'PM' : 'AM';
    final minuteStr = minute.toString().padLeft(2, '0');
    return '$hour12:$minuteStr $period';
  }

  /// Formats date and time as "Jan 1, 2024 at 3:45 PM"
  String get formattedDateTime {
    return '$formattedDate at $formattedTime';
  }

  /// Adds days to date
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// Subtracts days from date
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  /// Gets start of day (00:00:00)
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// Gets end of day (23:59:59)
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }
}

/// List extensions
extension ListExtensions<T> on List<T> {
  /// Safely gets element at index or returns null
  T? getOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Chunks list into smaller lists of specified size
  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (int i = 0; i < length; i += size) {
      chunks.add(sublist(i, (i + size > length) ? length : i + size));
    }
    return chunks;
  }

  /// Removes duplicates while preserving order
  List<T> get unique {
    final seen = <T>{};
    return where((element) => seen.add(element)).toList();
  }

  /// Shuffles list and returns new list
  List<T> shuffled() {
    final copy = List<T>.from(this);
    copy.shuffle();
    return copy;
  }
}

/// BuildContext extensions
extension BuildContextExtensions on BuildContext {
  /// Gets screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Gets screen width
  double get screenWidth => screenSize.width;

  /// Gets screen height
  double get screenHeight => screenSize.height;

  /// Checks if device is in portrait mode
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  /// Checks if device is in landscape mode
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  /// Gets theme data
  ThemeData get theme => Theme.of(this);

  /// Gets text theme
  TextTheme get textTheme => theme.textTheme;

  /// Gets color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Shows snackbar
  void showSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }

  /// Hides keyboard
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }

  /// Navigates to route
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push<T>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  /// Pops current route
  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  /// Checks if can pop
  bool get canPop => Navigator.of(this).canPop();
}

/// Number extensions
extension IntExtensions on int {
  /// Converts to currency string
  String toCurrency({String symbol = '\$'}) {
    final formatted = toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '$symbol$formatted';
  }

  /// Converts to ordinal (1st, 2nd, 3rd, etc.)
  String get ordinal {
    if (this >= 11 && this <= 13) return '${this}th';
    
    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }

  /// Checks if number is even
  bool get isEven => this % 2 == 0;

  /// Checks if number is odd
  bool get isOdd => this % 2 != 0;
}

extension DoubleExtensions on double {
  /// Converts to currency string
  String toCurrency({String symbol = '\$', int decimals = 2}) {
    final parts = toStringAsFixed(decimals).split('.');
    final integerPart = parts[0].replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return decimals > 0 ? '$symbol$integerPart.${parts[1]}' : '$symbol$integerPart';
  }

  /// Clamps value between min and max
  double clampValue(double min, double max) {
    return clamp(min, max);
  }
}
