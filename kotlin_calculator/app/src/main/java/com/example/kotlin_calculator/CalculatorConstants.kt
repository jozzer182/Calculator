package com.example.kotlin_calculator

import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

object CalculatorConstants {
    // UI Constants
    val buttonSize = 80.dp
    val buttonSpacing = 12.dp
    val cornerRadius = 40.dp
    val displayFontSize = 64.sp
    val buttonFontSize = 28.sp
    
    // Maximum display length
    const val maxDisplayLength = 9
    
    // Number formatting
    const val maxFractionDigits = 8
    const val scientificNotationThreshold = 1e15
    const val smallNumberThreshold = 1e-6
}

object CalculatorColors {
    val background = Color.Black
    val text = Color.White
    val numberButton = Color(0xFF333333)
    val operationButton = Color(0xFFFF9500)
    val functionButton = Color(0xFF999999)
}
