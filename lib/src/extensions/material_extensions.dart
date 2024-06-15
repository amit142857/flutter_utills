import 'package:flutter/material.dart';

/// Adds Extensions to Widget
extension ExtensionOnMaterial on Widget {
  /// Wraps widget with [ColoredBox] with given [color]
  Widget withColor(Color color) {
    return ColoredBox(
      color: color,
      child: this,
    );
  }

  /// Draws border around widget
  Widget withBorder({
    Color color = const Color(0xFF000000),
    double width = 1.0,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color, width: width),
      ),
      child: this,
    );
  }
}
