//
//  CalculatorButton.swift
//  calculator
//
//  Created by JOSE ZARABANDA on 7/25/25.
//

import SwiftUI

struct CalculatorButton: View {
    let title: String
    let backgroundColor: Color
    let foregroundColor: Color
    let isWide: Bool
    let action: () -> Void
    
    init(
        title: String,
        backgroundColor: Color = .gray,
        foregroundColor: Color = .white,
        isWide: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.isWide = isWide
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: CalculatorConstants.buttonFontSize))
                .fontWeight(.medium)
                .frame(
                    width: isWide ? (CalculatorConstants.buttonSize * 2 + CalculatorConstants.buttonSpacing) : CalculatorConstants.buttonSize,
                    height: CalculatorConstants.buttonSize
                )
                .background(backgroundColor)
                .foregroundColor(foregroundColor)
                .cornerRadius(CalculatorConstants.cornerRadius)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CalculatorButtonStyle {
    static let number = CalculatorColors.numberButton
    static let operation = CalculatorColors.operationButton
    static let function = CalculatorColors.functionButton
}

#Preview {
    VStack {
        CalculatorButton(title: "1", backgroundColor: CalculatorButtonStyle.number) { }
        CalculatorButton(title: "+", backgroundColor: CalculatorButtonStyle.operation) { }
        CalculatorButton(title: "C", backgroundColor: CalculatorButtonStyle.function, foregroundColor: .black) { }
        CalculatorButton(title: "0", backgroundColor: CalculatorButtonStyle.number, isWide: true) { }
    }
}
