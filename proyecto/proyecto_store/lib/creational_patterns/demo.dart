/// DEMOSTRACIÓN DE TODOS LOS PATRONES CREACIONALES
///
/// Este archivo contiene ejemplos prácticos de cómo usar cada patrón creacional
/// en un proyecto Flutter/Dart.

import 'singleton_pattern.dart';
import 'factory_method_pattern.dart';
import 'abstract_factory_pattern.dart';
import 'builder_pattern.dart';
import 'prototype_pattern.dart';

/// ============ FUNCIÓN PRINCIPAL DE DEMOSTRACIÓN =============

void demostrarTodosLosPatrones() {
  print('\n╔════════════════════════════════════════════════════════════╗');
  print('║         PATRONES CREACIONALES - DEMOSTRACIÓN COMPLETA      ║');
  print('╚════════════════════════════════════════════════════════════╝\n');

  // Demostración de Singleton
  demostrarSingleton();

  // Demostración de Factory Method
  ejemploFactoryMethod();

  // Demostración de Abstract Factory
  ejemploAbstractFactory();

  // Demostración de Builder
  ejemploBuilder();

  // Demostración de Prototype
  ejemploPrototype();

  print('\n╔════════════════════════════════════════════════════════════╗');
  print('║                   FIN DE DEMOSTRACIÓN                      ║');
  print('╚════════════════════════════════════════════════════════════╝\n');
}

/// ============ FUNCIÓN AUXILIAR PARA SINGLETON =============

void demostrarSingleton() {
  print('\n=== SINGLETON PATTERN ===\n');

  // Demostrar Logger Singleton
  final logger1 = Logger();
  final logger2 = Logger();

  logger1.log('Primera instancia del Logger');
  logger2.log('Segunda instancia (debe ser la misma que la primera)');
  logger1.error('Error desde la primera referencia');

  print('\n¿Son la misma instancia? ${identical(logger1, logger2)}');
  print('Total de logs: ${logger1.getAllLogs().length}');

  print('\n---');

  // Demostrar ConfigurationManager Singleton
  final config1 = ConfigurationManager();
  config1.set('debug_mode', false);

  final config2 = ConfigurationManager();
  print('\nConfiguración compartida entre instancias:');
  print('   API URL: ${config2.get('api_url')}');
  print('   Debug Mode: ${config2.get('debug_mode')} (modificado por config1)');
  print('   ¿Son la misma instancia? ${identical(config1, config2)}');

  print('\n---');

  // Demostrar CacheManager Singleton
  final cache1 = CacheManager();
  cache1.put('user_token', 'abc123xyz');
  cache1.put('user_id', 42);

  final cache2 = CacheManager();
  print('\nCache compartido entre instancias:');
  print('   Token: ${cache2.get('user_token')}');
  print('   User ID: ${cache2.get('user_id')}');
  print('   Tamaño del cache: ${cache2.getCacheSize()}');
  print('   ¿Son la misma instancia? ${identical(cache1, cache2)}');
}

/// ============ COMPARACIÓN DE PATRONES =============

void compararPatrones() {
  print('\n\n╔════════════════════════════════════════════════════════════╗');
  print('║             COMPARACIÓN DE PATRONES CREACIONALES           ║');
  print('╚════════════════════════════════════════════════════════════╝\n');

  print('📋 SINGLETON (Instancia Única)');
  print('   ├─ Uso: Logger, Config, Cache, API Service');
  print('   ├─ Ventajas: Globalidad, Control de instancia única');
  print('   └─ Desventajas: Difícil de testear, Global state\n');

  print('🏭 FACTORY METHOD (Creación por Tipo)');
  print('   ├─ Uso: Crear productos según tipo, Crear objetos polimórficos');
  print('   ├─ Ventajas: Flexibilidad, Desacoplamiento');
  print('   └─ Desventajas: Más código, Lógica condicional\n');

  print('🏢 ABSTRACT FACTORY (Familias de Productos)');
  print('   ├─ Uso: Crear ecosistemas coherentes (iOS/Android, Marcas)');
  print('   ├─ Ventajas: Consistencia entre productos relacionados');
  print('   └─ Desventajas: Complejidad, Más classes\n');

  print('🔨 BUILDER (Construcción Paso a Paso)');
  print('   ├─ Uso: Objetos con muchos parámetros opcionales');
  print('   ├─ Ventajas: Legibilidad, Validación, Parámetros opcionales');
  print('   └─ Desventajas: Más código, Overhead\n');

  print('👯 PROTOTYPE (Clonar Objetos)');
  print('   ├─ Uso: Clonar objetos, Variantes de templates');
  print('   ├─ Ventajas: Eficiente, Clones rápidos, Evita lógica compleja');
  print('   └─ Desventajas: Copias profundas pueden ser costosas\n');
}

/// ============ CUÁNDO USAR CADA PATRÓN =============

void guiaUso() {
  print('\n\n╔════════════════════════════════════════════════════════════╗');
  print('║                  GUÍA DE CUÁNDO USAR CADA PATRÓN           ║');
  print('╚════════════════════════════════════════════════════════════╝\n');

  final patrones = {
    '🔐 SINGLETON': [
      'Necesitas una única instancia en toda la aplicación',
      'Ejemplo: DatabaseConnection, Logger, AuthService, ApiService',
    ],
    '🏭 FACTORY METHOD': [
      'Tienes múltiples tipos relacionados de objetos',
      'Quieres crear objetos sin especificar sus clases exactas',
      'Ejemplo: ProductoFactory, TransportFactory',
    ],
    '🏢 ABSTRACT FACTORY': [
      'Trabajas con familias de objetos relacionados',
      'Necesitas garantizar consistencia entre productos',
      'Ejemplo: iOS/Android UI components, Theme systems',
    ],
    '🔨 BUILDER': [
      'Objetos con muchos parámetros (4 o más)',
      'Muchos parámetros opcionales',
      'Necesitas validación durante construcción',
      'Ejemplo: HttpRequest, DatabaseQuery, SearchCriteria',
    ],
    '👯 PROTOTYPE': [
      'Necesitas clonar objetos frecuentemente',
      'La creación de nuevos objetos es costosa',
      'Tienes un objeto "prototipo" que varías ligeramente',
      'Ejemplo: Copiar carritos, Templates, Clones de entidades',
    ],
  };

  patrones.forEach((nombre, casos) {
    print('$nombre');
    for (final caso in casos) {
      print('   • $caso');
    }
    print('');
  });
}

/// ============ EJEMPLO INTEGRADO =============

void ejemploIntegrado() {
  print('\n\n╔════════════════════════════════════════════════════════════╗');
  print('║            EJEMPLO INTEGRADO: TIENDA DE TELÉFONOS          ║');
  print('╚════════════════════════════════════════════════════════════╝\n');

  print('Escenario: Tienda online de teléfonos usando todos los patrones:\n');

  print('1. 🔐 SINGLETON - Logger de la tienda');
  print('   Logger().log("Tienda iniciada");');
  print('   → Registra eventos importantes\n');

  print('2. 🏭 FACTORY METHOD - Crear diferentes niveles de producto');
  print('   ProductoFactory.crearProducto(tipo: "premium", ...)');
  print('   → Crea productos Premium, Estándar o Económico\n');

  print('3. 🏢 ABSTRACT FACTORY - Crear tiendas por marca');
  print('   MarcaFactoryGenerator.obtenerFactory("Apple")');
  print('   → Crea tienda Apple con su servicio técnico\n');

  print('4. 🔨 BUILDER - Permitir búsquedas personalizadas');
  print('   TelefonoBuscadorBuilder()');
  print('       .conMarca("Samsung")');
  print('       .conPrecioMaximo(500)');
  print('       .conGarantia(true)');
  print('       .build()');
  print('   → Búsqueda flexible con criterios opcionales\n');

  print('5. 👯 PROTOTYPE - Clonar configuraciones de teléfono');
  print('   configiPhone15.cloneConCambios(newNombre: "iPhone 15 Pro Max")');
  print('   → Crear variantes rápidamente basadas en un prototipo\n');
}
