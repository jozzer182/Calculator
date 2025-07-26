package com.example.kotlin_calculator

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.lifecycle.viewmodel.compose.viewModel
import com.example.kotlin_calculator.ui.theme.Kotlin_calculatorTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            Kotlin_calculatorTheme {
                CalculatorApp()
            }
        }
    }
}

@Composable
fun CalculatorApp(calculator: CalculatorModel = viewModel()) {
    val display by calculator.display.collectAsState()
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(CalculatorColors.background)
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(20.dp),
            verticalArrangement = Arrangement.spacedBy(20.dp)
        ) {
            Spacer(modifier = Modifier.weight(1f))
            
            // Display
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.End
            ) {
                Text(
                    text = display,
                    fontSize = CalculatorConstants.displayFontSize,
                    fontWeight = FontWeight.Light,
                    color = CalculatorColors.text,
                    textAlign = TextAlign.End,
                    maxLines = 1
                )
            }
            
            // Button Grid
            Column(
                verticalArrangement = Arrangement.spacedBy(CalculatorConstants.buttonSpacing)
            ) {
                // Row 1: Clear buttons and division
                Row(
                    horizontalArrangement = Arrangement.spacedBy(CalculatorConstants.buttonSpacing)
                ) {
                    CalculatorButton(
                        title = "C",
                        backgroundColor = CalculatorButtonStyle.function,
                        foregroundColor = Color.Black
                    ) {
                        calculator.clearPressed()
                    }
                    
                    CalculatorButton(
                        title = "CE",
                        backgroundColor = CalculatorButtonStyle.function,
                        foregroundColor = Color.Black
                    ) {
                        calculator.clearEntryPressed()
                    }
                    
                    CalculatorButton(
                        title = "±",
                        backgroundColor = CalculatorButtonStyle.function,
                        foregroundColor = Color.Black
                    ) {
                        calculator.toggleSignPressed()
                    }
                    
                    CalculatorButton(
                        title = "÷",
                        backgroundColor = CalculatorButtonStyle.operation
                    ) {
                        calculator.operationPressed(CalculatorModel.Operation.DIVIDE)
                    }
                }
                
                // Row 2: 7, 8, 9, ×
                Row(
                    horizontalArrangement = Arrangement.spacedBy(CalculatorConstants.buttonSpacing)
                ) {
                    CalculatorButton(
                        title = "7",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(7)
                    }
                    
                    CalculatorButton(
                        title = "8",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(8)
                    }
                    
                    CalculatorButton(
                        title = "9",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(9)
                    }
                    
                    CalculatorButton(
                        title = "×",
                        backgroundColor = CalculatorButtonStyle.operation
                    ) {
                        calculator.operationPressed(CalculatorModel.Operation.MULTIPLY)
                    }
                }
                
                // Row 3: 4, 5, 6, −
                Row(
                    horizontalArrangement = Arrangement.spacedBy(CalculatorConstants.buttonSpacing)
                ) {
                    CalculatorButton(
                        title = "4",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(4)
                    }
                    
                    CalculatorButton(
                        title = "5",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(5)
                    }
                    
                    CalculatorButton(
                        title = "6",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(6)
                    }
                    
                    CalculatorButton(
                        title = "−",
                        backgroundColor = CalculatorButtonStyle.operation
                    ) {
                        calculator.operationPressed(CalculatorModel.Operation.SUBTRACT)
                    }
                }
                
                // Row 4: 1, 2, 3, +
                Row(
                    horizontalArrangement = Arrangement.spacedBy(CalculatorConstants.buttonSpacing)
                ) {
                    CalculatorButton(
                        title = "1",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(1)
                    }
                    
                    CalculatorButton(
                        title = "2",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(2)
                    }
                    
                    CalculatorButton(
                        title = "3",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.numberPressed(3)
                    }
                    
                    CalculatorButton(
                        title = "+",
                        backgroundColor = CalculatorButtonStyle.operation
                    ) {
                        calculator.operationPressed(CalculatorModel.Operation.ADD)
                    }
                }
                
                // Row 5: 0 (wide), ., =
                Row(
                    horizontalArrangement = Arrangement.spacedBy(CalculatorConstants.buttonSpacing)
                ) {
                    CalculatorButton(
                        title = "0",
                        backgroundColor = CalculatorButtonStyle.number,
                        isWide = true
                    ) {
                        calculator.numberPressed(0)
                    }
                    
                    CalculatorButton(
                        title = ".",
                        backgroundColor = CalculatorButtonStyle.number
                    ) {
                        calculator.decimalPressed()
                    }
                    
                    CalculatorButton(
                        title = "=",
                        backgroundColor = CalculatorButtonStyle.operation
                    ) {
                        calculator.equalsPressed()
                    }
                }
            }
            
            Spacer(modifier = Modifier.weight(1f))
        }
    }
}

@Preview(showBackground = true)
@Composable
fun CalculatorAppPreview() {
    Kotlin_calculatorTheme {
        CalculatorApp()
    }
}
