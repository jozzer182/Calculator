package com.example.kotlin_calculator

import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import java.text.DecimalFormat
import java.text.NumberFormat
import java.util.Locale
import kotlin.math.abs

class CalculatorModel : ViewModel() {
    
    private val _display = MutableStateFlow("0")
    val display: StateFlow<String> = _display.asStateFlow()
    
    private var currentValue: Double = 0.0
    private var previousValue: Double = 0.0
    private var currentOperation: Operation? = null
    private var shouldResetDisplay: Boolean = false
    
    enum class Operation(val symbol: String) {
        ADD("+"),
        SUBTRACT("−"),
        MULTIPLY("×"),
        DIVIDE("÷");
        
        fun calculate(a: Double, b: Double): Double {
            return when (this) {
                ADD -> a + b
                SUBTRACT -> a - b
                MULTIPLY -> a * b
                DIVIDE -> if (b != 0.0) a / b else Double.NaN
            }
        }
    }
    
    fun numberPressed(number: Int) {
        if (shouldResetDisplay) {
            _display.value = "0"
            shouldResetDisplay = false
        }
        
        if (_display.value == "0") {
            _display.value = number.toString()
        } else {
            _display.value += number.toString()
        }
        
        currentValue = _display.value.toDoubleOrNull() ?: 0.0
    }
    
    fun decimalPressed() {
        if (shouldResetDisplay) {
            _display.value = "0"
            shouldResetDisplay = false
        }
        
        if (!_display.value.contains(".")) {
            _display.value += "."
        }
    }
    
    fun operationPressed(operation: Operation) {
        if (currentOperation != null && !shouldResetDisplay) {
            calculateResult()
        }
        
        previousValue = currentValue
        currentOperation = operation
        shouldResetDisplay = true
    }
    
    fun equalsPressed() {
        calculateResult()
        currentOperation = null
        shouldResetDisplay = true
    }
    
    fun clearPressed() {
        _display.value = "0"
        currentValue = 0.0
        previousValue = 0.0
        currentOperation = null
        shouldResetDisplay = false
    }
    
    fun clearEntryPressed() {
        _display.value = "0"
        currentValue = 0.0
        shouldResetDisplay = false
    }
    
    fun toggleSignPressed() {
        if (_display.value == "0" || _display.value == "Error" || _display.value == "∞") {
            return
        }
        
        if (_display.value.startsWith("-")) {
            _display.value = _display.value.drop(1)
        } else {
            _display.value = "-" + _display.value
        }
        
        currentValue = _display.value.toDoubleOrNull() ?: 0.0
    }
    
    private fun calculateResult() {
        val operation = currentOperation ?: return
        
        val result = operation.calculate(previousValue, currentValue)
        
        when {
            result.isNaN() -> {
                _display.value = "Error"
                currentValue = 0.0
            }
            result.isInfinite() -> {
                _display.value = "∞"
                currentValue = 0.0
            }
            else -> {
                currentValue = result
                _display.value = formatResult(result)
            }
        }
    }
    
    private fun formatResult(value: Double): String {
        // Handle special cases
        if (value.isNaN()) return "Error"
        if (value.isInfinite()) return if (value > 0) "∞" else "-∞"
        
        // Check if the number is an integer
        if (value % 1.0 == 0.0 && abs(value) < 1e15) {
            return String.format(Locale.US, "%.0f", value)
        }
        
        // Format decimal numbers
        val formatter = DecimalFormat().apply {
            maximumFractionDigits = 8
            minimumFractionDigits = 0
            isGroupingUsed = false
        }
        
        // Fallback for very large/small numbers
        if (abs(value) >= 1e15 || (abs(value) < 1e-6 && value != 0.0)) {
            return String.format(Locale.US, "%.2e", value)
        }
        
        return formatter.format(value)
    }
}
