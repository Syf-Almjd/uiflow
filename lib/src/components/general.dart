import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uiflow/src/config/utils/managers/app_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

/// Generates a random code string of length 8 using alphanumeric characters.
String generateCode() {
  String chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  return String.fromCharCodes(Iterable.generate(
      8, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
}

/// Validates a form based on the provided GlobalKey<FormState>.
///
/// Returns true if the form is valid, otherwise false.
bool validateForm(GlobalKey<FormState> validateKey) {
  if (validateKey.currentState!.validate()) {
    validateKey.currentState!.save();
    return true;
  } else {
    return false;
  }
}

/// Opens a URL using the [url_launcher] package.
void openUrl(String url) {
  var openUrl = Uri.parse(url);
  launchUrl(
    openUrl,
    mode: LaunchMode.externalApplication,
  );
}

/// Converts an asset file to a Uint8List.
///
/// Useful for loading images or other assets as bytes.
Future<Uint8List> assetToUint8List(String assetPath) async {
  ByteData data = await rootBundle.load(assetPath);
  List<int> bytes = data.buffer.asUint8List();
  return Uint8List.fromList(bytes);
}

/// Retrieves a widget from a list by its index.
Widget getWidgetByIndex(int index, List<Widget> list) {
  return list[index];
}

/// Converts a date string to a human-readable format indicating the day and time.
String getDateTimeToDay(String dateString) {
  DateTime date = DateTime.parse(dateString).toLocal();
  String time = "${date.hour}:${date.minute}";

  if (date.day == DateTime.now().day) {
    return "Today, at $time";
  } else if (date.day == DateTime.now().day + 1) {
    return "Tomorrow, at $time";
  } else if (date.day == DateTime.now().day - 1) {
    return "Yesterday, at $time";
  } else {
    return ("${date.toUtc().day},  ${date.toUtc().month.dateMonthName.substring(0, 3)}. at: $time");
  }
}
