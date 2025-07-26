import 'package:flutter/material.dart';

class CalculatorConstants {
  // UI Constants
  static const double buttonSize = 80.0;
  static const double buttonSpacing = 12.0;
  static const double cornerRadius = 40.0;
  static const double displayFontSize = 64.0;
  static const double buttonFontSize = 28.0;
  
  // Maximum display length
  static const int maxDisplayLength = 9;
  
  // Number formatting
  static const int maxFractionDigits = 8;
  static const double scientificNotationThreshold = 1e15;
  static const double smallNumberThreshold = 1e-6;
}

class CalculatorColors {
  static const Color background = Colors.black;
  static const Color text = Colors.white;
  static const Color numberButton = Color(0xFF333333); // Color(red: 0.2, green: 0.2, blue: 0.2)
  static const Color operationButton = Colors.orange;
  static const Color functionButton = Color(0xFF999999); // Color(red: 0.6, green: 0.6, blue: 0.6)
}
