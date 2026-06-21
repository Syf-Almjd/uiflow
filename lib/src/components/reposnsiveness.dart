import 'package:flutter/material.dart';

/// Returns the height based on the specified percentage of the screen height.
double getHeight(int percent, BuildContext context) {
  return (MediaQuery.of(context).size.height * (percent / 100)).toDouble();
}

/// Returns a SizedBox with width and height based on the specified percentage of the screen dimensions.
SizedBox getCube(int percent, BuildContext context) {
  return SizedBox(
    width: (MediaQuery.of(context).size.width * (percent / 100)).toDouble(),
    height: (MediaQuery.of(context).size.height * (percent / 100)).toDouble(),
  );
}

/// Returns the width based on the specified percentage of the screen width.
double getWidth(int percent, BuildContext context) {
  return (MediaQuery.of(context).size.width * (percent / 100)).toDouble();
}

/// Returns a Padding widget with uniform padding on all sides.
///
/// Parameters:
/// - [size]: The size of the padding. Defaults to 10 if not specified.
Widget padBox({double? size}) {
  return Padding(padding: EdgeInsets.all(size ?? 10));
}
