# Flutter Calculator

Una calculadora completa desarrollada en Flutter que replica la funcionalidad y diseño de una calculadora moderna.

## Características

- **Operaciones básicas**: Suma (+), resta (−), multiplicación (×), división (÷)
- **Funciones adicionales**:
  - **C**: Limpiar todo (Clear)
  - **CE**: Limpiar entrada actual (Clear Entry)
  - **±**: Cambiar signo del número actual
  - **Punto decimal**: Para números decimales
- **Interfaz moderna**: Diseño oscuro con botones coloridos similares a calculadoras iOS
- **Manejo de errores**: Detecta divisiones por cero y números inválidos
- **Formato inteligente**: Muestra números enteros sin decimales y formatea apropiadamente los decimales

## Estructura del proyecto

```
lib/
├── main.dart                    # Punto de entrada de la aplicación
├── calculator_screen.dart       # Pantalla principal con la interfaz
├── calculator_model.dart        # Lógica de la calculadora
├── calculator_button.dart       # Widget de botón personalizado
└── calculator_constants.dart    # Constantes de diseño y colores
```

## Funcionamiento

### Botones Numéricos (0-9)
- Permiten ingresar números
- El botón "0" es más ancho para mejor accesibilidad

### Botones de Operación
- **+**: Suma
- **−**: Resta  
- **×**: Multiplicación
- **÷**: División
- **=**: Ejecuta la operación

### Botones de Función
- **C**: Borra todo y reinicia la calculadora
- **CE**: Borra solo la entrada actual
- **±**: Cambia el signo del número actual (positivo/negativo)
- **.**: Añade punto decimal

## Cómo ejecutar

1. Asegúrate de tener Flutter instalado
2. Navega al directorio del proyecto:
   ```bash
   cd fluter_calculator
   ```
3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Diseño

La calculadora utiliza un esquema de colores que incluye:
- **Fondo**: Negro
- **Botones numéricos**: Gris oscuro (#333333)
- **Botones de operación**: Naranja
- **Botones de función**: Gris claro (#999999)
- **Texto**: Blanco

## Compatibilidad

La aplicación está diseñada para funcionar en:
- Android
- iOS  
- Web
- Windows
- macOS
- Linux

¡Disfruta de tu nueva calculadora Flutter! 🧮✨
