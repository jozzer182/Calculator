import 'package:flutter/foundation.dart';

enum Operation {
  add,
  subtract,
  multiply,
  divide,
}

extension OperationExtension on Operation {
  String get symbol {
    switch (this) {
      case Operation.add:
        return '+';
      case Operation.subtract:
        return '−';
      case Operation.multiply:
        return '×';
      case Operation.divide:
        return '÷';
    }
  }

  double calculate(double a, double b) {
    switch (this) {
      case Operation.add:
        return a + b;
      case Operation.subtract:
        return a - b;
      case Operation.multiply:
        return a * b;
      case Operation.divide:
        if (b == 0) return double.nan;
        return a / b;
    }
  }
}

class CalculatorModel extends ChangeNotifier {
  String _display = "0";
  double _currentValue = 0;
  double _previousValue = 0;
  Operation? _currentOperation;
  bool _shouldResetDisplay = false;

  String get display => _display;

  void numberPressed(int number) {
    if (_shouldResetDisplay) {
      _display = "0";
      _shouldResetDisplay = false;
    }

    if (_display == "0") {
      _display = number.toString();
    } else {
      _display += number.toString();
    }

    _currentValue = double.tryParse(_display) ?? 0;
    notifyListeners();
  }

  void decimalPressed() {
    if (_shouldResetDisplay) {
      _display = "0";
      _shouldResetDisplay = false;
    }

    if (!_display.contains(".")) {
      _display += ".";
    }
    notifyListeners();
  }

  void operationPressed(Operation operation) {
    if (_currentOperation != null && !_shouldResetDisplay) {
      _calculateResult();
    }

    _previousValue = _currentValue;
    _currentOperation = operation;
    _shouldResetDisplay = true;
    notifyListeners();
  }

  void equalsPressed() {
    _calculateResult();
    _currentOperation = null;
    _shouldResetDisplay = true;
    notifyListeners();
  }

  void clearPressed() {
    _display = "0";
    _currentValue = 0;
    _previousValue = 0;
    _currentOperation = null;
    _shouldResetDisplay = false;
    notifyListeners();
  }

  void clearEntryPressed() {
    _display = "0";
    _currentValue = 0;
    _shouldResetDisplay = false;
    notifyListeners();
  }

  void toggleSignPressed() {
    if (_display == "0" || _display == "Error" || _display == "∞") {
      return;
    }

    if (_display.startsWith("-")) {
      _display = _display.substring(1);
    } else {
      _display = "-$_display";
    }

    _currentValue = double.tryParse(_display) ?? 0;
    notifyListeners();
  }

  void _calculateResult() {
    if (_currentOperation == null) return;

    final result = _currentOperation!.calculate(_previousValue, _currentValue);

    if (result.isNaN) {
      _display = "Error";
      _currentValue = 0;
    } else if (result.isInfinite) {
      _display = "∞";
      _currentValue = 0;
    } else {
      _currentValue = result;
      _display = _formatResult(result);
    }
  }

  String _formatResult(double value) {
    // Handle special cases
    if (value.isNaN) {
      return "Error";
    }
    if (value.isInfinite) {
      return value > 0 ? "∞" : "-∞";
    }

    // Check if the number is an integer
    if (value % 1 == 0 && value.abs() < 1e15) {
      return value.toInt().toString();
    }

    // Format decimal numbers
    String formatted = value.toString();
    
    // Remove trailing zeros after decimal point
    if (formatted.contains('.')) {
      formatted = formatted.replaceAll(RegExp(r'0*$'), '');
      formatted = formatted.replaceAll(RegExp(r'\.$'), '');
    }

    // Fallback for very large/small numbers
    if (value.abs() >= 1e15 || (value.abs() < 1e-6 && value != 0)) {
      return value.toStringAsExponential(2);
    }

    return formatted;
  }
}
