import 'package:flutter/material.dart';
import 'calculator_constants.dart';

class CalculatorButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool isWide;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.title,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.white,
    this.isWide = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CalculatorConstants.buttonSize,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CalculatorConstants.cornerRadius),
          ),
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: CalculatorConstants.buttonFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
