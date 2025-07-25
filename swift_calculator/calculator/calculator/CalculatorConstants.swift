//
//  CalculatorConstants.swift
//  calculator
//
//  Created by JOSE ZARABANDA on 7/25/25.
//

import SwiftUI

struct CalculatorConstants {
    // UI Constants
    static let buttonSize: CGFloat = 80
    static let buttonSpacing: CGFloat = 12
    static let cornerRadius: CGFloat = 40
    static let displayFontSize: CGFloat = 64
    static let buttonFontSize: CGFloat = 28
    
    // Maximum display length
    static let maxDisplayLength = 9
    
    // Number formatting
    static let maxFractionDigits = 8
    static let scientificNotationThreshold = 1e15
    static let smallNumberThreshold = 1e-6
}

extension Color {
    static let calculatorBackground = Color.black
    static let calculatorText = Color.white
}

struct CalculatorColors {
    static let background = Color.black
    static let text = Color.white
    static let numberButton = Color(red: 0.2, green: 0.2, blue: 0.2)
    static let operationButton = Color.orange
    static let functionButton = Color(red: 0.6, green: 0.6, blue: 0.6)
}
