//
//  CalculatorModel.swift
//  calculator
//
//  Created by JOSE ZARABANDA on 7/25/25.
//

import Foundation

class CalculatorModel: ObservableObject {
    @Published var display: String = "0"
    
    private var currentValue: Double = 0
    private var previousValue: Double = 0
    private var currentOperation: Operation?
    private var shouldResetDisplay: Bool = false
    
    enum Operation: String, CaseIterable {
        case add = "+"
        case subtract = "−"
        case multiply = "×"
        case divide = "÷"
        
        var symbol: String {
            return self.rawValue
        }
        
        func calculate(_ a: Double, _ b: Double) -> Double {
            switch self {
            case .add:
                return a + b
            case .subtract:
                return a - b
            case .multiply:
                return a * b
            case .divide:
                guard b != 0 else { return Double.nan }
                return a / b
            }
        }
    }
    
    func numberPressed(_ number: Int) {
        if shouldResetDisplay {
            display = "0"
            shouldResetDisplay = false
        }
        
        if display == "0" {
            display = String(number)
        } else {
            display += String(number)
        }
        
        currentValue = Double(display) ?? 0
    }
    
    func decimalPressed() {
        if shouldResetDisplay {
            display = "0"
            shouldResetDisplay = false
        }
        
        if !display.contains(".") {
            display += "."
        }
    }
    
    func operationPressed(_ operation: Operation) {
        if currentOperation != nil && !shouldResetDisplay {
            calculateResult()
        }
        
        previousValue = currentValue
        currentOperation = operation
        shouldResetDisplay = true
    }
    
    func equalsPressed() {
        calculateResult()
        currentOperation = nil
        shouldResetDisplay = true
    }
    
    func clearPressed() {
        display = "0"
        currentValue = 0
        previousValue = 0
        currentOperation = nil
        shouldResetDisplay = false
    }
    
    func clearEntryPressed() {
        display = "0"
        currentValue = 0
        shouldResetDisplay = false
    }
    
    func toggleSignPressed() {
        if display == "0" || display == "Error" || display == "∞" {
            return
        }
        
        if display.hasPrefix("-") {
            display = String(display.dropFirst())
        } else {
            display = "-" + display
        }
        
        currentValue = Double(display) ?? 0
    }
    
    private func calculateResult() {
        guard let operation = currentOperation else { return }
        
        let result = operation.calculate(previousValue, currentValue)
        
        if result.isNaN {
            display = "Error"
            currentValue = 0
        } else if result.isInfinite {
            display = "∞"
            currentValue = 0
        } else {
            currentValue = result
            display = formatResult(result)
        }
    }
    
    private func formatResult(_ value: Double) -> String {
        // Handle special cases
        if value.isNaN {
            return "Error"
        }
        if value.isInfinite {
            return value > 0 ? "∞" : "-∞"
        }
        
        // Check if the number is an integer
        if value.truncatingRemainder(dividingBy: 1) == 0 && abs(value) < 1e15 {
            return String(format: "%.0f", value)
        }
        
        // Format decimal numbers
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 8
        formatter.minimumFractionDigits = 0
        formatter.usesGroupingSeparator = false
        
        if let formatted = formatter.string(from: NSNumber(value: value)) {
            return formatted
        }
        
        // Fallback for very large/small numbers
        if abs(value) >= 1e15 || (abs(value) < 1e-6 && value != 0) {
            return String(format: "%.2e", value)
        }
        
        return String(value)
    }
}
