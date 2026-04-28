/// PATRÓN ABSTRACT FACTORY
///
/// Proporciona una interfaz para crear familias de objetos relacionados
/// sin especificar sus clases concretas.
///
/// Características:
/// - Abstract factory que define métodos para crear productos relacionados
/// - Productos relacionados (ejemplo: iOS, Android)
/// - Factories concretas que implementan la creación
/// - Utilidad: crear ecosistemas de productos coherentes

import '../models/marca.dart';

/// ============ PRODUCTOS ABSTRACTOS =============

abstract class Tienda {
  String get nombre;
  String get ubicacion;
  void mostrarInfo();
}

abstract class ServicioTecnico {
  String get nombre;
  String get especialidad;
  void atenderCliente();
}

/// ============ PRODUCTOS CONCRETOS: TIENDAS =============

class TiendaApple implements Tienda {
  @override
  final String nombre = 'Apple Store';
  @override
  final String ubicacion;

  TiendaApple({required this.ubicacion});

  @override
  void mostrarInfo() {
    print('🍎 TIENDA APPLE');
    print('   Nombre: $nombre');
    print('   Ubicación: $ubicacion');
    print('   Productos: iPhone, iPad, MacBook, AirPods');
  }
}

class TiendaSamsung implements Tienda {
  @override
  final String nombre = 'Samsung Store';
  @override
  final String ubicacion;

  TiendaSamsung({required this.ubicacion});

  @override
  void mostrarInfo() {
    print('📱 TIENDA SAMSUNG');
    print('   Nombre: $nombre');
    print('   Ubicación: $ubicacion');
    print('   Productos: Galaxy S, Galaxy A, Galaxy Tab');
  }
}

class TiendaXiaomi implements Tienda {
  @override
  final String nombre = 'Mi Store';
  @override
  final String ubicacion;

  TiendaXiaomi({required this.ubicacion});

  @override
  void mostrarInfo() {
    print('🔴 TIENDA XIAOMI');
    print('   Nombre: $nombre');
    print('   Ubicación: $ubicacion');
    print('   Productos: Redmi, Mi, Poco');
  }
}

/// ============ PRODUCTOS CONCRETOS: SERVICIOS TÉCNICOS =============

class ServicioApple implements ServicioTecnico {
  @override
  final String nombre = 'Apple Care+';
  @override
  final String especialidad = 'Reparación de productos Apple';

  @override
  void atenderCliente() {
    print('🔧 APPLE CARE TÉCNICO');
    print('   Atendiendo con expertos certificados en products Apple');
    print('   Repuestos originales garantizados');
  }
}

class ServicioSamsung implements ServicioTecnico {
  @override
  final String nombre = 'Samsung Service';
  @override
  final String especialidad = 'Reparación de productos Samsung';

  @override
  void atenderCliente() {
    print('🔧 SAMSUNG SERVICE TÉCNICO');
    print('   Atendiendo con especialistas en productos Samsung');
    print('   Garantía oficial Samsung');
  }
}

class ServicioXiaomi implements ServicioTecnico {
  @override
  final String nombre = 'Xiaomi Service';
  @override
  final String especialidad = 'Reparación de productos Xiaomi';

  @override
  void atenderCliente() {
    print('🔧 XIAOMI SERVICE TÉCNICO');
    print('   Atendiendo con técnicos especializados Xiaomi');
    print('   Repuestos Xiaomi certificados');
  }
}

/// ============ ABSTRACT FACTORY =============

abstract class MarcaFactory {
  Tienda crearTienda(String ubicacion);
  ServicioTecnico crearServicioTecnico();
}

/// ============ FACTORIES CONCRETAS =============

class AppleFactory implements MarcaFactory {
  @override
  Tienda crearTienda(String ubicacion) {
    return TiendaApple(ubicacion: ubicacion);
  }

  @override
  ServicioTecnico crearServicioTecnico() {
    return ServicioApple();
  }
}

class SamsungFactory implements MarcaFactory {
  @override
  Tienda crearTienda(String ubicacion) {
    return TiendaSamsung(ubicacion: ubicacion);
  }

  @override
  ServicioTecnico crearServicioTecnico() {
    return ServicioSamsung();
  }
}

class XiaomiFactory implements MarcaFactory {
  @override
  Tienda crearTienda(String ubicacion) {
    return TiendaXiaomi(ubicacion: ubicacion);
  }

  @override
  ServicioTecnico crearServicioTecnico() {
    return ServicioXiaomi();
  }
}

/// ============ GENERADOR DE FACTORIES =============

class MarcaFactoryGenerator {
  static MarcaFactory obtenerFactory(String marcaNombre) {
    switch (marcaNombre.toLowerCase()) {
      case 'apple':
        return AppleFactory();
      case 'samsung':
        return SamsungFactory();
      case 'xiaomi':
        return XiaomiFactory();
      default:
        throw Exception('Marca no soportada: $marcaNombre');
    }
  }
}

/// ============ EJEMPLO DE USO =============

void ejemploAbstractFactory() {
  print('\n=== ABSTRACT FACTORY PATTERN ===\n');

  // Obtener factory para Apple
  final appleFactory = MarcaFactoryGenerator.obtenerFactory('apple');
  final tiendaApple = appleFactory.crearTienda('New York');
  final servicioApple = appleFactory.crearServicioTecnico();

  tiendaApple.mostrarInfo();
  print('');
  servicioApple.atenderCliente();

  print('\n');

  // Obtener factory para Samsung
  final samsungFactory = MarcaFactoryGenerator.obtenerFactory('samsung');
  final tiendaSamsung = samsungFactory.crearTienda('Madrid');
  final servicioSamsung = samsungFactory.crearServicioTecnico();

  tiendaSamsung.mostrarInfo();
  print('');
  servicioSamsung.atenderCliente();

  print('\n');

  // Obtener factory para Xiaomi
  final xiaomiFactory = MarcaFactoryGenerator.obtenerFactory('xiaomi');
  final tiendaXiaomi = xiaomiFactory.crearTienda('Barcelona');
  final servicioXiaomi = xiaomiFactory.crearServicioTecnico();

  tiendaXiaomi.mostrarInfo();
  print('');
  servicioXiaomi.atenderCliente();
}
