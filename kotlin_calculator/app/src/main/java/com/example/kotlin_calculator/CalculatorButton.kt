package com.example.kotlin_calculator

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview

@Composable
fun CalculatorButton(
    title: String,
    backgroundColor: Color = Color.Gray,
    foregroundColor: Color = Color.White,
    isWide: Boolean = false,
    onClick: () -> Unit
) {
    Box(
        modifier = Modifier
            .width(
                if (isWide) 
                    CalculatorConstants.buttonSize * 2 + CalculatorConstants.buttonSpacing 
                else 
                    CalculatorConstants.buttonSize
            )
            .height(CalculatorConstants.buttonSize)
            .clip(RoundedCornerShape(CalculatorConstants.cornerRadius))
            .background(backgroundColor)
            .clickable { onClick() },
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = title,
            fontSize = CalculatorConstants.buttonFontSize,
            fontWeight = FontWeight.Medium,
            color = foregroundColor,
            textAlign = TextAlign.Center
        )
    }
}

object CalculatorButtonStyle {
    val number = CalculatorColors.numberButton
    val operation = CalculatorColors.operationButton
    val function = CalculatorColors.functionButton
}

@Preview
@Composable
fun CalculatorButtonPreview() {
    CalculatorButton(
        title = "1",
        backgroundColor = CalculatorButtonStyle.number
    ) { }
}
