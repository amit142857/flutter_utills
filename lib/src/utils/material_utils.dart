import 'dart:math';

import 'package:flutter/material.dart';

/// Utils class for Material with useful static methods
class MaterialUtils {
  /// Returns random [Color] from [MaterialColor] and [MaterialAccentColor]
  static Color getRandomMaterialColor() {
    final List<Color> colors = [
      ...Colors.primaries,
      ...Colors.accents,
    ];

    final color = colors[Random().nextInt(colors.length)];
    return color;
  }

  /// Returns random [Color]
  static Color getRandomColor() {
    final random = Random();

    final r = random.nextInt(256);
    final g = random.nextInt(256);
    final b = random.nextInt(256);

    return Color.fromARGB(255, r, g, b);
  }
}
