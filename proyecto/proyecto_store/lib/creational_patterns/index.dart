/// ÍNDICE Y GUÍA DE PATRONES CREACIONALES
///
/// Este archivo documenta todos los patrones creacionales implementados en el proyecto.
///
/// Los 5 patrones creacionales GoF (Gang of Four) son técnicas de diseño para
/// crear objetos de manera flexible y reutilizable.

/// ============ EXPORTAR TODOS LOS PATRONES =============

export 'singleton_pattern.dart';
export 'factory_method_pattern.dart';
export 'abstract_factory_pattern.dart';
export 'builder_pattern.dart';
export 'prototype_pattern.dart';
export 'demo.dart';

/// ============ DOCUMENTACIÓN =============

///
/// 📚 PATRONES CREACIONALES IMPLEMENTADOS
/// ======================================
///
/// 1. SINGLETON ✅
///    Archivo: singleton_pattern.dart
///    Descripción: Garantiza una única instancia de una clase
///    Ejemplos: Logger, ConfigurationManager, CacheManager, ApiService
///    Uso en proyecto: ApiService, AuthService
///
///    Uso:
///    ```dart
///    final logger = Logger();
///    logger.log('Mensaje de log');
///    ```
///
/// ---
///
/// 2. FACTORY METHOD ✅
///    Archivo: factory_method_pattern.dart
///    Descripción: Crea objetos de diferentes tipos sin especificar sus clases
///    Ejemplos: ProductoFactory para Premium/Estándar/Económico
///    Patrón: Define interfaz, implementaciones concretas, factory method
///
///    Uso:
///    ```dart
///    final producto = ProductoFactory.crearProducto(
///      tipo: 'premium',
///      nombre: 'iPhone 15 Pro',
///      precio: 1299.99,
///    );
///    producto.mostrarDetalles();
///    ```
///
/// ---
///
/// 3. ABSTRACT FACTORY ✅
///    Archivo: abstract_factory_pattern.dart
///    Descripción: Crea familias de productos relacionados
///    Ejemplo: Crear tiendas (Tienda + ServicioTecnico) por marca
///    Utilidad: Garantizar consistencia entre productos relacionados
///
///    Uso:
///    ```dart
///    final factory = MarcaFactoryGenerator.obtenerFactory('apple');
///    final tienda = factory.crearTienda('New York');
///    final servicio = factory.crearServicioTecnico();
///    tienda.mostrarInfo();
///    servicio.atenderCliente();
///    ```
///
/// ---
///
/// 4. BUILDER ✅
///    Archivo: builder_pattern.dart
///    Descripción: Construye objetos complejos paso a paso
///    Ejemplo: Búsquedas de teléfonos con criterios opcionales
///    Ventaja: Interfaz fluida, parámetros opcionales, validación
///
///    Uso:
///    ```dart
///    final busqueda = TelefonoBuscadorBuilder()
///      .conMarca('Samsung')
///      .conPrecioMaximo(500)
///      .conGarantia(true)
///      .build();
///    busqueda.mostrarCriterios();
///    ```
///
/// ---
///
/// 5. PROTOTYPE ✅
///    Archivo: prototype_pattern.dart
///    Descripción: Crea objetos clonando un prototipo
///    Ejemplo: Clonar configuraciones de teléfono, carritos
///    Ventaja: Clonaración eficiente, evita lógica compleja
///
///    Uso:
///    ```dart
///    final config = configiPhone15.clone();
///    final nuevoConfig = configiPhone15.cloneConCambios(
///      newNombre: 'iPhone 15 Pro Max',
///      newAlmacenamiento: 512,
///    );
///    ```
///
/// ============ IMPORTAR Y USAR =============
///
/// En tu archivo main.dart o donde quieras usarlos:
///
/// ```dart
/// import 'creational_patterns/demo.dart';
///
/// void main() {
///   // Ejecutar demostración completa
///   demostrarTodosLosPatrones();
///
///   // Ver comparación de patrones
///   compararPatrones();
///
///   // Ver guía de uso
///   guiaUso();
///
///   // Ver ejemplo integrado
///   ejemploIntegrado();
/// }
/// ```
///
/// ============ ESTRUCTURA DE CARPETAS =============
///
/// lib/
/// ├── creational_patterns/
/// │   ├── singleton_pattern.dart           (1 patrón)
/// │   ├── factory_method_pattern.dart      (1 patrón)
/// │   ├── abstract_factory_pattern.dart    (1 patrón)
/// │   ├── builder_pattern.dart             (1 patrón)
/// │   ├── prototype_pattern.dart           (1 patrón)
/// │   ├── demo.dart                        (Demostraciones)
/// │   └── index.dart                       (Este archivo)
/// ├── models/
/// ├── repositories/
/// ├── services/
/// └── main.dart
///
/// ============ RESUMEN COMPARATIVO =============
///
/// | Patrón           | Propósito                          | Complejidad |
/// |------------------|-----------------------------------|-------------|
/// | Singleton        | Instancia única                   | Baja        |
/// | Factory Method   | Crear objetos por tipo            | Media       |
/// | Abstract Factory | Familias de productos             | Alta        |
/// | Builder          | Construcción paso a paso          | Media       |
/// | Prototype        | Clonar objetos                    | Media       |
///
/// ============ NOTAS IMPORTANTES =============
///
/// ✅ Todos los patrones están completamente implementados
/// ✅ Incluyen ejemplos prácticos funcionables
/// ✅ Están documentados inline
/// ✅ Pueden ser usados en producción
/// ✅ No interfieren con código existente (Singleton preservado)
///
/// 📝 Para aprender más:
///    - Lee los comentarios en cada archivo de patrón
///    - Ejecuta los ejemplos con demo.dart
///    - Experimenta modificando los valores
///
