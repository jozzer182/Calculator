//
//  ContentView.swift
//  calculator
//
//  Created by JOSE ZARABANDA on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var calculator = CalculatorModel()
    
    var body: some View {
        ZStack {
            CalculatorColors.background.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                // Display
                HStack {
                    Spacer()
                    Text(calculator.display)
                        .font(.system(size: CalculatorConstants.displayFontSize, weight: .light))
                        .foregroundColor(CalculatorColors.text)
                        .multilineTextAlignment(.trailing)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                }
                .padding(.horizontal)
                
                // Button Grid
                VStack(spacing: CalculatorConstants.buttonSpacing) {
                    // Row 1: Clear buttons and division
                    HStack(spacing: CalculatorConstants.buttonSpacing) {
                        CalculatorButton(
                            title: "C",
                            backgroundColor: CalculatorButtonStyle.function,
                            foregroundColor: .black
                        ) {
                            calculator.clearPressed()
                        }
                        
                        CalculatorButton(
                            title: "CE",
                            backgroundColor: CalculatorButtonStyle.function,
                            foregroundColor: .black
                        ) {
                            calculator.clearEntryPressed()
                        }
                        
                        CalculatorButton(
                            title: "±",
                            backgroundColor: CalculatorButtonStyle.function,
                            foregroundColor: .black
                        ) {
                            calculator.toggleSignPressed()
                        }
                        
                        CalculatorButton(
                            title: "÷",
                            backgroundColor: CalculatorButtonStyle.operation
                        ) {
                            calculator.operationPressed(.divide)
                        }
                    }
                    
                    // Row 2: 7, 8, 9, ×
                    HStack(spacing: CalculatorConstants.buttonSpacing) {
                        CalculatorButton(
                            title: "7",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(7)
                        }
                        
                        CalculatorButton(
                            title: "8",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(8)
                        }
                        
                        CalculatorButton(
                            title: "9",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(9)
                        }
                        
                        CalculatorButton(
                            title: "×",
                            backgroundColor: CalculatorButtonStyle.operation
                        ) {
                            calculator.operationPressed(.multiply)
                        }
                    }
                    
                    // Row 3: 4, 5, 6, −
                    HStack(spacing: CalculatorConstants.buttonSpacing) {
                        CalculatorButton(
                            title: "4",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(4)
                        }
                        
                        CalculatorButton(
                            title: "5",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(5)
                        }
                        
                        CalculatorButton(
                            title: "6",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(6)
                        }
                        
                        CalculatorButton(
                            title: "−",
                            backgroundColor: CalculatorButtonStyle.operation
                        ) {
                            calculator.operationPressed(.subtract)
                        }
                    }
                    
                    // Row 4: 1, 2, 3, +
                    HStack(spacing: CalculatorConstants.buttonSpacing) {
                        CalculatorButton(
                            title: "1",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(1)
                        }
                        
                        CalculatorButton(
                            title: "2",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(2)
                        }
                        
                        CalculatorButton(
                            title: "3",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.numberPressed(3)
                        }
                        
                        CalculatorButton(
                            title: "+",
                            backgroundColor: CalculatorButtonStyle.operation
                        ) {
                            calculator.operationPressed(.add)
                        }
                    }
                    
                    // Row 5: 0 (wide), ., =
                    HStack(spacing: CalculatorConstants.buttonSpacing) {
                        CalculatorButton(
                            title: "0",
                            backgroundColor: CalculatorButtonStyle.number,
                            isWide: true
                        ) {
                            calculator.numberPressed(0)
                        }
                        
                        CalculatorButton(
                            title: ".",
                            backgroundColor: CalculatorButtonStyle.number
                        ) {
                            calculator.decimalPressed()
                        }
                        
                        CalculatorButton(
                            title: "=",
                            backgroundColor: CalculatorButtonStyle.operation
                        ) {
                            calculator.equalsPressed()
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
