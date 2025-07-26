import 'package:flutter/material.dart';
import 'calculator_model.dart';
import 'calculator_button.dart';
import 'calculator_constants.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorModel _calculator = CalculatorModel();

  @override
  void initState() {
    super.initState();
    _calculator.addListener(_onCalculatorChanged);
  }

  @override
  void dispose() {
    _calculator.removeListener(_onCalculatorChanged);
    super.dispose();
  }

  void _onCalculatorChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalculatorColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    _calculator.display,
                    style: const TextStyle(
                      fontSize: CalculatorConstants.displayFontSize,
                      fontWeight: FontWeight.w300,
                      color: CalculatorColors.text,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    // Row 1: Clear buttons and division
                    _buildButtonRow([
                      CalculatorButton(
                        title: "C",
                        backgroundColor: CalculatorColors.functionButton,
                        foregroundColor: Colors.black,
                        onPressed: _calculator.clearPressed,
                      ),
                      CalculatorButton(
                        title: "CE",
                        backgroundColor: CalculatorColors.functionButton,
                        foregroundColor: Colors.black,
                        onPressed: _calculator.clearEntryPressed,
                      ),
                      CalculatorButton(
                        title: "±",
                        backgroundColor: CalculatorColors.functionButton,
                        foregroundColor: Colors.black,
                        onPressed: _calculator.toggleSignPressed,
                      ),
                      CalculatorButton(
                        title: "÷",
                        backgroundColor: CalculatorColors.operationButton,
                        onPressed: () => _calculator.operationPressed(Operation.divide),
                      ),
                    ]),
                    
                    // Row 2: 7, 8, 9, ×
                    _buildButtonRow([
                      CalculatorButton(
                        title: "7",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(7),
                      ),
                      CalculatorButton(
                        title: "8",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(8),
                      ),
                      CalculatorButton(
                        title: "9",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(9),
                      ),
                      CalculatorButton(
                        title: "×",
                        backgroundColor: CalculatorColors.operationButton,
                        onPressed: () => _calculator.operationPressed(Operation.multiply),
                      ),
                    ]),
                    
                    // Row 3: 4, 5, 6, −
                    _buildButtonRow([
                      CalculatorButton(
                        title: "4",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(4),
                      ),
                      CalculatorButton(
                        title: "5",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(5),
                      ),
                      CalculatorButton(
                        title: "6",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(6),
                      ),
                      CalculatorButton(
                        title: "−",
                        backgroundColor: CalculatorColors.operationButton,
                        onPressed: () => _calculator.operationPressed(Operation.subtract),
                      ),
                    ]),
                    
                    // Row 4: 1, 2, 3, +
                    _buildButtonRow([
                      CalculatorButton(
                        title: "1",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(1),
                      ),
                      CalculatorButton(
                        title: "2",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(2),
                      ),
                      CalculatorButton(
                        title: "3",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: () => _calculator.numberPressed(3),
                      ),
                      CalculatorButton(
                        title: "+",
                        backgroundColor: CalculatorColors.operationButton,
                        onPressed: () => _calculator.operationPressed(Operation.add),
                      ),
                    ]),
                    
                    // Row 5: 0 (wide), ., =
                    _buildButtonRow([
                      CalculatorButton(
                        title: "0",
                        backgroundColor: CalculatorColors.numberButton,
                        isWide: true,
                        onPressed: () => _calculator.numberPressed(0),
                      ),
                      CalculatorButton(
                        title: ".",
                        backgroundColor: CalculatorColors.numberButton,
                        onPressed: _calculator.decimalPressed,
                      ),
                      CalculatorButton(
                        title: "=",
                        backgroundColor: CalculatorColors.operationButton,
                        onPressed: _calculator.equalsPressed,
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<CalculatorButton> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((button) {
          return Expanded(
            flex: button.isWide ? 2 : 1,
            child: Padding(
              padding: const EdgeInsets.all(CalculatorConstants.buttonSpacing / 2),
              child: button,
            ),
          );
        }).toList(),
      ),
    );
  }
}
