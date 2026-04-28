/// ARCHIVO DE PRUEBA: Ejecuta todos los patrones creacionales
/// 
/// Este archivo es opcional y está diseñado para demostrar
/// cómo ejecutar y probar todos los patrones en la consola.

import 'creational_patterns/demo.dart';

/// ============ FUNCIÓN PRINCIPAL DE PRUEBA =============

void testearPatronesCreacionales() {
  print('\n\n');
  print('╔════════════════════════════════════════════════════════════╗');
  print('║                                                            ║');
  print('║     🎯 TESTING DE PATRONES CREACIONALES 🎯                ║');
  print('║                                                            ║');
  print('╚════════════════════════════════════════════════════════════╝');

  // Ejecutar todas las demostraciones
  demostrarTodosLosPatrones();

  // Mostrar comparación
  compararPatrones();

  // Mostrar guía de uso
  guiaUso();

  // Mostrar ejemplo integrado
  ejemploIntegrado();

  print('\n\n✅ Todas las pruebas completadas exitosamente\n\n');
}

/// ============ FUNCIÓN ALTERNATIVA: PRUEBAS INDIVIDUALES =============

void testearPorIndividual() {
  print('\n\n═══════════════════════════════════════════════════════════');
  print('PRUEBAS INDIVIDUALES DE PATRONES CREACIONALES');
  print('═══════════════════════════════════════════════════════════\n');

  print('Selecciona qué patrón deseas probar:');
  print('1. Singleton');
  print('2. Factory Method');
  print('3. Abstract Factory');
  print('4. Builder');
  print('5. Prototype');
  print('6. Todos (completo)');
  print('\nPara usar: descomenta la línea que quieras en main.dart');
  print('Ejemplo: testearSingleton();\n');
}

// ============ FUNCIONES INDIVIDUALES DE PRUEBA =============

void testearSingleton() {
  print('\n═════════════════════════════════════════════════════════════');
  print('PRUEBA: SINGLETON PATTERN');
  print('═════════════════════════════════════════════════════════════\n');

  import 'creational_patterns/singleton_pattern.dart' as singleton;

  // Probar Logger
  final log1 = singleton.Logger();
  final log2 = singleton.Logger();
  log1.log('Mensaje 1 desde instancia 1');
  log2.log('Mensaje 2 desde instancia 2');
  print('\n✓ Singleton verificado: ${identical(log1, log2)}\n');
}

void testearFactoryMethod() {
  print('\n═════════════════════════════════════════════════════════════');
  print('PRUEBA: FACTORY METHOD PATTERN');
  print('═════════════════════════════════════════════════════════════\n');

  import 'creational_patterns/factory_method_pattern.dart';

  ejemploFactoryMethod();
}

void testearAbstractFactory() {
  print('\n═════════════════════════════════════════════════════════════');
  print('PRUEBA: ABSTRACT FACTORY PATTERN');
  print('═════════════════════════════════════════════════════════════\n');

  import 'creational_patterns/abstract_factory_pattern.dart';

  ejemploAbstractFactory();
}

void testearBuilder() {
  print('\n═════════════════════════════════════════════════════════════');
  print('PRUEBA: BUILDER PATTERN');
  print('═════════════════════════════════════════════════════════════\n');

  import 'creational_patterns/builder_pattern.dart';

  ejemploBuilder();
}

void testearPrototype() {
  print('\n═════════════════════════════════════════════════════════════');
  print('PRUEBA: PROTOTYPE PATTERN');
  print('═════════════════════════════════════════════════════════════\n');

  import 'creational_patterns/prototype_pattern.dart';

  ejemploPrototype();
}

// ============ NOTAS DE USO =============

/*

📋 INSTRUCCIONES DE USO:

1. PRUEBA COMPLETA:
   Importa este archivo en main.dart:
   
   import 'test_creational_patterns.dart';
   
   Y ejecuta en main():
   
   testearPatronesCreacionales();

2. EJECUTAR PROYECTO:
   flutter run -v

3. VER OUTPUT EN:
   Console de VS Code / Terminal

4. ESTRUCTURA ACTUALIZADA:
   lib/
   ├── creational_patterns/          ← Nuevos patrones
   │   ├── singleton_pattern.dart
   │   ├── factory_method_pattern.dart
   │   ├── abstract_factory_pattern.dart
   │   ├── builder_pattern.dart
   │   ├── prototype_pattern.dart
   │   ├── demo.dart
   │   └── index.dart
   ├── models/
   ├── repositories/
   ├── services/
   ├── screens/
   ├── main.dart
   └── test_creational_patterns.dart  ← Este archivo

⚠️ IMPORTANTE:
   - El Singleton original en ApiService NO ha sido modificado
   - Los nuevos patrones están en archivos separados
   - Puedes usar los patrones en cualquier parte de tu código
   - Los ejemplos están en las funciones ejemplo*()

*/
