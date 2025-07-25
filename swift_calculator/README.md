# Calculadora iOS en Swift

Esta es una calculadora nativa de iOS desarrollada en **Swift** usando **SwiftUI**. La aplicación implementa una interfaz similar a la calculadora nativa de iOS con funcionalidad completa para operaciones básicas.

## 🚀 Características

### Operaciones Básicas
- ✅ **Suma** (+)
- ✅ **Resta** (−)
- ✅ **Multiplicación** (×)
- ✅ **División** (÷)

### Funcionalidades Adicionales
- ✅ **Punto decimal** (.) para números decimales
- ✅ **Cambio de signo** (±) para números positivos/negativos
- ✅ **Clear** (C) para limpiar toda la calculadora
- ✅ **Clear Entry** (CE) para limpiar solo la entrada actual
- ✅ **Validación de división por cero** (muestra "Error")
- ✅ **Manejo de números infinitos** (muestra "∞")
- ✅ **Formateo automático de números** (enteros vs decimales)
- ✅ **Notación científica** para números muy grandes o pequeños

## 🏗️ Arquitectura

### Patrón MVVM (Model-View-ViewModel)
- **`CalculatorModel`**: Lógica de negocio y estado de la calculadora
- **`ContentView`**: Interfaz de usuario principal
- **`CalculatorButton`**: Componente reutilizable para botones
- **`CalculatorConstants`**: Constantes de diseño y configuración

### Archivos Principales
```
calculator/
├── calculatorApp.swift          # Punto de entrada de la app
├── ContentView.swift           # Vista principal con UI
├── CalculatorModel.swift       # Lógica de la calculadora
├── CalculatorButton.swift      # Componente de botón personalizado
├── CalculatorConstants.swift   # Constantes y estilos
└── Assets.xcassets/           # Recursos gráficos
```

## 🎨 Diseño

### Colores y Estilo
- **Fondo**: Negro (`#000000`)
- **Display**: Texto blanco con fuente ligera
- **Botones de números**: Gris oscuro (`rgb(51, 51, 51)`)
- **Botones de operaciones**: Naranja (`Orange`)
- **Botones de función**: Gris claro (`rgb(153, 153, 153)`)

### Layout Responsivo
- **Grid de 4×5** botones organizados de manera lógica
- **Botón "0" extendido** (doble ancho)
- **Esquinas redondeadas** en todos los botones
- **Espaciado consistente** entre elementos

## 🔧 Instalación y Ejecución

### Requisitos
- **Xcode 15+**
- **iOS 17.0+** como target mínimo
- **macOS 13+** para desarrollo

### Pasos para Ejecutar
1. **Abrir el proyecto**:
   ```bash
   open swift_calculator/calculator/calculator.xcodeproj
   ```

2. **Seleccionar simulator o dispositivo**:
   - iPhone 15/16 (recomendado)
   - iPad (compatible)
   - Dispositivo físico iOS

3. **Compilar y ejecutar**:
   - Presiona `Cmd + R` en Xcode
   - O usa el botón ▶️ en Xcode

### Compilación desde Terminal
```bash
cd swift_calculator/calculator
xcodebuild -scheme calculator -destination 'platform=iOS Simulator,name=iPhone 16' build
```

## 🧪 Casos de Uso y Ejemplos

### Operaciones Básicas
```
7 + 3 = 10
15 - 8 = 7
6 × 4 = 24
20 ÷ 4 = 5
```

### Casos Especiales
```
10 ÷ 0 = Error
±5 = -5
±(-5) = 5
3.14159... (formateo automático)
1e+15 (notación científica para números grandes)
```

### Operaciones Encadenadas
```
5 + 3 × 2 = 16  (5 + 3 = 8, luego 8 × 2 = 16)
```

## 🐛 Manejo de Errores

- **División por cero**: Muestra "Error" en display
- **Resultados infinitos**: Muestra "∞" o "-∞"
- **Números muy grandes**: Notación científica automática
- **Entradas inválidas**: Validación preventiva

## 🔄 Estados de la Calculadora

1. **Inicial**: Display muestra "0"
2. **Ingresando número**: Display muestra el número actual
3. **Post-operación**: Display listo para nuevo número
4. **Error**: Display muestra mensaje de error
5. **Resultado**: Display muestra resultado de operación

## 📱 Compatibilidad

- **iOS 17.0+**
- **iPhone** (todas las pantallas)
- **iPad** (modo compatible)
- **Orientación**: Portrait y Landscape
- **Tamaños de pantalla**: Adaptativo

## 🚧 Mejoras Futuras

- [ ] **Modo científico** (sin², √, %, x², etc.)
- [ ] **Historial de operaciones**
- [ ] **Modo oscuro/claro**
- [ ] **Animaciones de botones**
- [ ] **Sonidos de teclado**
- [ ] **Soporte para gestos** (swipe para delete)
- [ ] **Tests unitarios**
- [ ] **Localización** (i18n)

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo `LICENSE` para más detalles.

---

**Desarrollado con ❤️ en Swift + SwiftUI**
