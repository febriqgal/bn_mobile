import 'package:flutter/material.dart';

// const Color AppColors.primaryColor = Color(0xFF22004C);

class AppColors {
  static const Color primaryColor = Colors.blue;
  static final MaterialColor myCustomSwatch =
      MaterialColor(primaryColor.value, <int, Color>{
    50: const Color(0xFFeefaff),
    100: const Color(0xFFC5CAE9),
    200: const Color(0xFF9FA8DA),
    300: const Color(0xFF7986CB),
    400: const Color(0xFF5C6BC0),
    500: Color(primaryColor.value),
    600: const Color(0xFF2196f3),
    700: const Color(0xFF167bdf),
    800: const Color(0xFF1863b5),
    900: const Color(0xFF153456),
  });
}
