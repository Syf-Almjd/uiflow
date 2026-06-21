import 'package:flutter/services.dart';

/// Collection of text input formatters for common use cases
class AppFormatters {
  /// Formats phone numbers as (XXX) XXX-XXXX
  static TextInputFormatter phone() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text.replaceAll(RegExp(r'\D'), '');
      
      if (text.isEmpty) {
        return newValue.copyWith(text: '');
      }

      StringBuffer formatted = StringBuffer();
      
      if (text.isNotEmpty) {
        formatted.write('(');
        formatted.write(text.substring(0, text.length.clamp(0, 3)));
        
        if (text.length >= 3) {
          formatted.write(') ');
          formatted.write(text.substring(3, text.length.clamp(3, 6)));
          
          if (text.length >= 6) {
            formatted.write('-');
            formatted.write(text.substring(6, text.length.clamp(6, 10)));
          }
        }
      }

      final formattedText = formatted.toString();
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }

  /// Formats credit card numbers as XXXX XXXX XXXX XXXX
  static TextInputFormatter creditCard() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text.replaceAll(RegExp(r'\D'), '');
      
      if (text.isEmpty) {
        return newValue.copyWith(text: '');
      }

      final buffer = StringBuffer();
      for (int i = 0; i < text.length; i++) {
        buffer.write(text[i]);
        final nonZeroIndex = i + 1;
        if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
          buffer.write(' ');
        }
      }

      final formattedText = buffer.toString();
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }

  /// Formats currency as $X,XXX.XX
  static TextInputFormatter currency({String symbol = '\$', int decimals = 2}) {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.isEmpty) {
        return newValue.copyWith(text: '');
      }

      final onlyDigits = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
      
      if (onlyDigits.isEmpty) {
        return newValue.copyWith(text: '');
      }

      final number = int.parse(onlyDigits);
      final decimal = number / (decimals == 0 ? 1 : (10 * decimals));
      
      String formatted = decimal.toStringAsFixed(decimals);
      
      // Add thousand separators
      List<String> parts = formatted.split('.');
      String integerPart = parts[0];
      String decimalPart = parts.length > 1 ? parts[1] : '';
      
      String withCommas = '';
      int count = 0;
      for (int i = integerPart.length - 1; i >= 0; i--) {
        if (count != 0 && count % 3 == 0) {
          withCommas = ',$withCommas';
        }
        withCommas = integerPart[i] + withCommas;
        count++;
      }
      
      formatted = decimals > 0 ? '$symbol$withCommas.$decimalPart' : '$symbol$withCommas';
      
      return TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    });
  }

  /// Uppercase formatter
  static TextInputFormatter uppercase() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      return TextEditingValue(
        text: newValue.text.toUpperCase(),
        selection: newValue.selection,
      );
    });
  }

  /// Lowercase formatter
  static TextInputFormatter lowercase() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      return TextEditingValue(
        text: newValue.text.toLowerCase(),
        selection: newValue.selection,
      );
    });
  }

  /// Capitalize first letter of each word
  static TextInputFormatter capitalize() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final words = newValue.text.split(' ');
      final capitalized = words.map((word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }).join(' ');
      
      return TextEditingValue(
        text: capitalized,
        selection: newValue.selection,
      );
    });
  }

  /// Digits only formatter
  static TextInputFormatter digitsOnly() {
    return FilteringTextInputFormatter.digitsOnly;
  }

  /// Letters only formatter
  static TextInputFormatter lettersOnly() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'));
  }

  /// Alphanumeric only formatter
  static TextInputFormatter alphanumeric() {
    return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'));
  }

  /// Date formatter (DD/MM/YYYY)
  static TextInputFormatter date() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text.replaceAll(RegExp(r'\D'), '');
      
      if (text.isEmpty) {
        return newValue.copyWith(text: '');
      }

      StringBuffer formatted = StringBuffer();
      
      for (int i = 0; i < text.length && i < 8; i++) {
        if (i == 2 || i == 4) {
          formatted.write('/');
        }
        formatted.write(text[i]);
      }

      final formattedText = formatted.toString();
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }

  /// Expiry date formatter (MM/YY)
  static TextInputFormatter expiryDate() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text.replaceAll(RegExp(r'\D'), '');
      
      if (text.isEmpty) {
        return newValue.copyWith(text: '');
      }

      StringBuffer formatted = StringBuffer();
      
      for (int i = 0; i < text.length && i < 4; i++) {
        if (i == 2) {
          formatted.write('/');
        }
        formatted.write(text[i]);
      }

      final formattedText = formatted.toString();
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }

  /// Social Security Number formatter (XXX-XX-XXXX)
  static TextInputFormatter ssn() {
    return TextInputFormatter.withFunction((oldValue, newValue) {
      final text = newValue.text.replaceAll(RegExp(r'\D'), '');
      
      if (text.isEmpty) {
        return newValue.copyWith(text: '');
      }

      StringBuffer formatted = StringBuffer();
      
      for (int i = 0; i < text.length && i < 9; i++) {
        if (i == 3 || i == 5) {
          formatted.write('-');
        }
        formatted.write(text[i]);
      }

      final formattedText = formatted.toString();
      return TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    });
  }
}
