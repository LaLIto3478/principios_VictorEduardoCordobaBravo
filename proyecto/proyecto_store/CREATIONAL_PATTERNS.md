# 🎯 Patrones Creacionales - Documentación Completa

## 📚 Introducción

Este proyecto implementa **TODOS los 5 Patrones Creacionales** del Gang of Four (GoF) de manera funcional y práctica, integrados perfectamente con tu proyecto Flutter `proyecto_store`.

### ¿Qué es un Patrón Creacional?
Son patrones de diseño que manejan la **creación de objetos** de formas que hacen el código más flexible, modular y reutilizable.

---

## 🏗️ Estructura del Proyecto

```
proyecto_store/
├── lib/
│   ├── creational_patterns/              ← 📦 NUEVOS PATRONES CREACIONALES
│   │   ├── singleton_pattern.dart        ✅ Patrón 1: Instancia única
│   │   ├── factory_method_pattern.dart   ✅ Patrón 2: Crear por tipo
│   │   ├── abstract_factory_pattern.dart ✅ Patrón 3: Familias de productos
│   │   ├── builder_pattern.dart          ✅ Patrón 4: Construcción paso a paso
│   │   ├── prototype_pattern.dart        ✅ Patrón 5: Clonar objetos
│   │   ├── demo.dart                     📋 Demostraciones
│   │   └── index.dart                    📖 Guía y referencia
│   ├── models/                           (Existentes)
│   ├── repositories/                     (Existentes)
│   ├── services/                         (Existentes)
│   ├── screens/                          (Existentes)
│   ├── test_creational_patterns.dart     🧪 Archivo de prueba
│   └── main.dart                         (Existente)
```

---

## 📖 Los 5 Patrones Creacionales

### 1️⃣ SINGLETON - Instancia Única

**Archivo:** `singleton_pattern.dart`

**Propósito:** Garantiza que una clase tenga una única instancia en toda la aplicación.

**Cuándo usarlo:**
- Logger global
- Gestor de configuración
- Conexión a base de datos
- Servicio API
- Cache global

**Ejemplo:**
```dart
// Crear instancia
final logger = Logger();
logger.log('Mensaje importante');

// Segunda referencia = MISMA instancia
final logger2 = Logger();
print(identical(logger, logger2)); // true ✅
```

**Implementación:**
```dart
class Logger {
  static final Logger _instance = Logger._internal();
  
  Logger._internal();
  
  factory Logger() => _instance;
  
  static Logger getInstance() => _instance;
}
```

---

### 2️⃣ FACTORY METHOD - Crear por Tipo

**Archivo:** `factory_method_pattern.dart`

**Propósito:** Define una interfaz para crear objetos, pero permite que diferentes tipos de objetos se creen según los parámetros.

**Cuándo usarlo:**
- Diferentes tipos de productos (Premium, Estándar, Económico)
- Crear objetos polimórficos
- Desacoplar creación de código cliente

**Ejemplo:**
```dart
// Factory crea el tipo correcto automáticamente
final productoPremium = ProductoFactory.crearProducto(
  tipo: 'premium',
  nombre: 'iPhone 15 Pro Max',
  precio: 1299.99,
  caracteristicasExtra: '5G, ProMotion, A17 Pro',
);

final productoBasico = ProductoFactory.crearProducto(
  tipo: 'economico',
  nombre: 'Xiaomi Redmi',
  precio: 299.99,
);

// Ambos implementan Producto pero son tipos diferentes
productoPremium.mostrarDetalles();
productoBasico.mostrarDetalles();
```

**Ventajas:**
- ✅ Código cliente no conoce clases concretas
- ✅ Fácil agregar nuevos tipos
- ✅ Centraliza lógica de creación

---

### 3️⃣ ABSTRACT FACTORY - Familias de Productos

**Archivo:** `abstract_factory_pattern.dart`

**Propósito:** Proporciona una interfaz para crear **familias de objetos relacionados** sin especificar sus clases concretas.

**Cuándo usarlo:**
- Crear tiendas con sus servicios técnicos por marca
- Temas UI (iOS vs Android)
- Diferentes "ecosistemas" coherentes

**Ejemplo:**
```dart
// Obtener factory para Apple
final appleFactory = MarcaFactoryGenerator.obtenerFactory('apple');
final tiendaApple = appleFactory.crearTienda('New York');
final servicioApple = appleFactory.crearServicioTecnico();

tiendaApple.mostrarInfo();        // TiendaApple + datos Apple
servicioApple.atenderCliente();   // ServicioApple especializado

// Obtener factory para Samsung
final samsungFactory = MarcaFactoryGenerator.obtenerFactory('samsung');
final tiendaSamsung = samsungFactory.crearTienda('Madrid');
final servicioSamsung = samsungFactory.crearServicioTecnico();
// Coherencia garantizada: TiendaSamsung + ServicioSamsung
```

**Ventajas:**
- ✅ Garantiza consistencia entre productos relacionados
- ✅ Fácil cambiar de "familia" completa
- ✅ Código organizado por marca/tema

---

### 4️⃣ BUILDER - Construcción Paso a Paso

**Archivo:** `builder_pattern.dart`

**Propósito:** Separa la construcción de un objeto complejo de su representación, permitiendo construirlo **paso a paso de manera flexible**.

**Cuándo usarlo:**
- Objetos con **muchos parámetros** (4 o más)
- **Parámetros opcionales**
- **Validación** durante construcción
- Necesitas **interfaz fluida** (chainable)

**Ejemplo:**
```dart
// Búsqueda con builder - parámetros opcionales, interfaz fluida
final busqueda = TelefonoBuscadorBuilder()
    .conMarca('Samsung')
    .conPrecioEntre(300, 800)
    .conGarantia(true)
    .build();  // ← Constructor final

busqueda.mostrarCriterios();

// Crear teléfono personalizado
final telefono = TelefonoPersonalizadoBuilder()
    .nombre('iPhone 15 Pro')
    .precio(999.99)
    .marca('Apple')
    .especificaciones('A17 Pro, 8GB RAM')
    .cantidad(50)
    .disponible(true)
    .imagen('iphone15.jpg')
    .build();
```

**Ventajas:**
- ✅ Interfaz fluida y legible
- ✅ Parámetros opcionales sin overloads
- ✅ Validación centralizada en `build()`
- ✅ Código más mantenible

---

### 5️⃣ PROTOTYPE - Clonar Objetos

**Archivo:** `prototype_pattern.dart`

**Propósito:** Especifica los tipos de objetos a crear usando una instancia prototípica y crea nuevas instancias **clonando ese prototipo**.

**Cuándo usarlo:**
- Clonar objetos frecuentemente
- Crear variantes de un objeto base
- Operaciones de copia profunda
- Registros de templates

**Ejemplo:**
```dart
// Crear prototipo
final configiPhone15 = ConfiguracionTelefonoPrototype(
  nombre: 'iPhone 15 Pro',
  procesador: 'A17 Pro',
  ram: 8,
  almacenamiento: 256,
  pantalla: 6.1,
  sistemaOperativo: 'iOS 17',
  camaras: ['48MP', '12MP Ultra Wide', '12MP Telefoto'],
  bateria: 3274,
);

// Clonar y modificar para crear variantes
final iphone15ProMax = configiPhone15.cloneConCambios(
  newNombre: 'iPhone 15 Pro Max',
  newAlmacenamiento: 512,
  newPantalla: 6.7,
);

// Registro de prototipos
final registry = PrototypeRegistry();
registry.registrar('samsung_base', samsungPrototype);
final samsungClon = registry.obtenerClon('samsung_base');
```

**Ventajas:**
- ✅ Clonación eficiente
- ✅ Evita código complejo de instanciación
- ✅ Fácil crear variantes
- ✅ Registro centralizado de templates

---

## 🚀 Cómo Usar en Tu Proyecto

### Opción 1: Ejecutar Demo Completa

```dart
// En main.dart
import 'creational_patterns/demo.dart';

void main() {
  // Ver TODAS las demostraciones
  demostrarTodosLosPatrones();
  
  // Ver comparación de patrones
  compararPatrones();
  
  // Ver guía de cuándo usar cada uno
  guiaUso();
  
  // Ver ejemplo integrado
  ejemploIntegrado();
  
  runApp(const PhoneStoreApp());
}
```

### Opción 2: Usar Patrones Individuales

```dart
// Usar Factory Method en tu código
import 'creational_patterns/factory_method_pattern.dart';

void miPantalla() {
  final producto = ProductoFactory.crearProducto(
    tipo: 'premium',
    nombre: 'Mi Producto',
    precio: 999.99,
  );
  producto.mostrarDetalles();
}
```

### Opción 3: Usar en Funciones

```dart
// Builder para búsquedas complejas
final busqueda = TelefonoBuscadorBuilder()
    .conMarca('Apple')
    .conPrecioMaximo(1500)
    .conRAMMinima(8)
    .conGarantia(true)
    .build();

// Abstract Factory para crear ecosistemas
final factory = MarcaFactoryGenerator.obtenerFactory('Apple');
final tienda = factory.crearTienda('Campus Madrid');
```

---

## 📊 Tabla Comparativa

| Patrón | Propósito | Complejidad | Casos de Uso |
|--------|-----------|------------|-------------|
| **Singleton** | Instancia única global | ⭐ Baja | Logger, Config, API Service |
| **Factory Method** | Crear por tipo | ⭐⭐ Media | Productos, Objetos polimórficos |
| **Abstract Factory** | Familias coherentes | ⭐⭐⭐ Alta | Tiendas por marca, Temas UI |
| **Builder** | Construcción flexible | ⭐⭐ Media | Búsquedas, Queries, Objetos complejos |
| **Prototype** | Clonar eficientemente | ⭐⭐ Media | Copias, Variantes, Templates |

---

## 🧪 Pruebas

```bash
# Ejecutar proyecto
flutter run -v

# Ver output en consola
# Verás todas las demostraciones de patrones
```

---

## ✅ Verificación: Singleton Preservado

```dart
// El Singleton original en ApiService sigue funcionando:
import 'services/api_service.dart';

final api1 = ApiService();
final api2 = ApiService();
print(identical(api1, api2)); // true ✅ - Singleton preservado
```

---

## 📝 Notas Importantes

✅ **Todos los patrones están completamente implementados y funcionan**
✅ **Incluyen ejemplos prácticos y ejecutables**
✅ **Están completamente documentados inline**
✅ **El Singleton original NO ha sido modificado**
✅ **Los nuevos patrones están en archivos separados**
✅ **Pueden ser usados en producción**
✅ **No interfieren con código existente**

---

## 🎓 Para Aprender Más

1. **Lee los comentarios** en cada archivo `*_pattern.dart`
2. **Ejecuta las funciones demo** para ver ejemplos
3. **Experimenta** modificando los valores
4. **Integra patrones** en tu código gradualmente

---

## 📚 Referencias

- Gang of Four (GoF) - Design Patterns
- Effective Dart - Design Patterns
- Flutter Best Practices
- Clean Code Principles

---

## 📞 Resumen de Archivos

| Archivo | Patrón | Utilidad |
|---------|--------|----------|
| `singleton_pattern.dart` | Singleton | Logger, Config, Cache |
| `factory_method_pattern.dart` | Factory Method | Crear productos por tipo |
| `abstract_factory_pattern.dart` | Abstract Factory | Tiendas + Servicios por marca |
| `builder_pattern.dart` | Builder | Búsquedas, Construcción flexible |
| `prototype_pattern.dart` | Prototype | Clonar configuraciones y objetos |
| `demo.dart` | Demo | Demostraciones completas |
| `index.dart` | Índice | Guía y documentación |

---

**¡Proyecto completado con éxito! 🎉**
Todos los patrones creacionales implementados y listos para usar.
