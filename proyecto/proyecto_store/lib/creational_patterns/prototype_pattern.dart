/// PATRÓN PROTOTYPE
///
/// Especifica los tipos de objetos a crear usando una instancia prototípica
/// y crea nuevas instancias clonando ese prototipo.
///
/// Características:
/// - Interfaz Cloneable o método clone()
/// - Implementaciones concretas que clonan sus atributos
/// - Registro de prototipos (opcional)
/// - Utilidad: crear objetos a partir de un prototipo sin conocer su clase exacta

import 'dart:convert';
import '../models/marca.dart';

/// ============ INTERFAZ PROTOTYPE =============

abstract class Cloneable<T> {
  T clone();
}

/// ============ IMPLEMENTACIONES PROTOTYPE =============

/// Prototype de Marca cloneable
class MarcaPrototype extends Marca implements Cloneable<MarcaPrototype> {
  MarcaPrototype({
    required int id,
    required String nombre,
    required String pais,
    required String? descripcion,
    required String? sitioWeb,
  }) : super(
         id: id,
         nombre: nombre,
         pais: pais,
         descripcion: descripcion,
         sitioWeb: sitioWeb,
       );

  @override
  MarcaPrototype clone() {
    // Clon profundo: crea una nueva instancia con los mismos valores
    return MarcaPrototype(
      id: id,
      nombre: nombre,
      pais: pais,
      descripcion: descripcion,
      sitioWeb: sitioWeb,
    );
  }

  /// Clon con modificaciones (shallow copy)
  MarcaPrototype cloneConCambios({
    int? newId,
    String? newNombre,
    String? newPais,
    String? newDescripcion,
    String? newSitioWeb,
  }) {
    return MarcaPrototype(
      id: newId ?? id,
      nombre: newNombre ?? nombre,
      pais: newPais ?? pais,
      descripcion: newDescripcion ?? descripcion,
      sitioWeb: newSitioWeb ?? sitioWeb,
    );
  }
}

/// Prototype de configuración de teléfono
class ConfiguracionTelefonoPrototype
    implements Cloneable<ConfiguracionTelefonoPrototype> {
  final String nombre;
  final String procesador;
  final int ram;
  final int almacenamiento;
  final double pantalla;
  final String sistemaOperativo;
  final List<String> camaras;
  final int bateria;

  ConfiguracionTelefonoPrototype({
    required this.nombre,
    required this.procesador,
    required this.ram,
    required this.almacenamiento,
    required this.pantalla,
    required this.sistemaOperativo,
    required this.camaras,
    required this.bateria,
  });

  @override
  ConfiguracionTelefonoPrototype clone() {
    return ConfiguracionTelefonoPrototype(
      nombre: nombre,
      procesador: procesador,
      ram: ram,
      almacenamiento: almacenamiento,
      pantalla: pantalla,
      sistemaOperativo: sistemaOperativo,
      camaras: List.from(camaras),
      bateria: bateria,
    );
  }

  /// Clon con modificaciones
  ConfiguracionTelefonoPrototype cloneConCambios({
    String? newNombre,
    String? newProcesador,
    int? newRam,
    int? newAlmacenamiento,
    double? newPantalla,
    String? newSistemaOperativo,
    List<String>? newCamaras,
    int? newBateria,
  }) {
    return ConfiguracionTelefonoPrototype(
      nombre: newNombre ?? nombre,
      procesador: newProcesador ?? procesador,
      ram: newRam ?? ram,
      almacenamiento: newAlmacenamiento ?? almacenamiento,
      pantalla: newPantalla ?? pantalla,
      sistemaOperativo: newSistemaOperativo ?? sistemaOperativo,
      camaras: newCamaras ?? List.from(camaras),
      bateria: newBateria ?? bateria,
    );
  }

  void mostrarConfig() {
    print('📱 Configuración: $nombre');
    print('   🔧 Procesador: $procesador');
    print('   🧠 RAM: ${ram}GB');
    print('   💾 Almacenamiento: ${almacenamiento}GB');
    print('   📺 Pantalla: ${pantalla.toStringAsFixed(1)}"');
    print('   🖥️ SO: $sistemaOperativo');
    print('   📷 Cámaras: ${camaras.join(', ')}');
    print('   🔋 Batería: ${bateria}mAh');
  }
}

/// Prototype de carrito de compras
class CarritoPrototype implements Cloneable<CarritoPrototype> {
  final String idCarrito;
  final Map<String, dynamic> items;
  final double total;
  final DateTime fechaCreacion;

  CarritoPrototype({
    required this.idCarrito,
    required this.items,
    required this.total,
    required this.fechaCreacion,
  });

  @override
  CarritoPrototype clone() {
    return CarritoPrototype(
      idCarrito: idCarrito,
      items: Map.from(items),
      total: total,
      fechaCreacion: DateTime.from(fechaCreacion),
    );
  }

  /// Clon vacío manteniendo la estructura
  CarritoPrototype cloneVacio() {
    return CarritoPrototype(
      idCarrito: 'carrito_${DateTime.now().millisecondsSinceEpoch}',
      items: {},
      total: 0.0,
      fechaCreacion: DateTime.now(),
    );
  }

  void mostrarCarrito() {
    print('🛒 CARRITO ID: $idCarrito');
    print('   Items: ${items.length}');
    print('   Total: \$${total.toStringAsFixed(2)}');
    print('   Creado: $fechaCreacion');
  }
}

/// ============ REGISTRO DE PROTOTIPOS =============

class PrototypeRegistry {
  static final PrototypeRegistry _instance = PrototypeRegistry._internal();

  final Map<String, dynamic> _prototipos = {};

  PrototypeRegistry._internal();

  factory PrototypeRegistry() {
    return _instance;
  }

  static PrototypeRegistry getInstance() {
    return _instance;
  }

  /// Registrar un prototipo
  void registrar(String clave, dynamic prototipo) {
    _prototipos[clave] = prototipo;
    print('✅ Prototipo registrado: $clave');
  }

  /// Obtener clon de un prototipo registrado
  dynamic obtenerClon(String clave) {
    if (!_prototipos.containsKey(clave)) {
      throw Exception('Prototipo no encontrado: $clave');
    }
    return _prototipos[clave]!.clone();
  }

  /// Obtener clon de un prototipo con cambios
  dynamic obtenerClonConCambios(String clave, Map<String, dynamic> cambios) {
    if (!_prototipos.containsKey(clave)) {
      throw Exception('Prototipo no encontrado: $clave');
    }

    final prototipo = _prototipos[clave];
    if (prototipo is ConfiguracionTelefonoPrototype) {
      return prototipo.cloneConCambios(
        newNombre: cambios['nombre'],
        newProcesador: cambios['procesador'],
        newRam: cambios['ram'],
        newAlmacenamiento: cambios['almacenamiento'],
        newPantalla: cambios['pantalla'],
        newSistemaOperativo: cambios['sistemaOperativo'],
        newCamaras: cambios['camaras'],
        newBateria: cambios['bateria'],
      );
    } else if (prototipo is MarcaPrototype) {
      return prototipo.cloneConCambios(
        newId: cambios['id'],
        newNombre: cambios['nombre'],
        newPais: cambios['pais'],
        newDescripcion: cambios['descripcion'],
        newSitioWeb: cambios['sitioWeb'],
      );
    } else {
      return prototipo.clone();
    }
  }

  /// Listar todos los prototipos disponibles
  List<String> listarPrototipos() {
    return _prototipos.keys.toList();
  }

  /// Limpiar todos los prototipos
  void limpiar() {
    _prototipos.clear();
  }
}

/// ============ EJEMPLO DE USO =============

void ejemploPrototype() {
  print('\n=== PROTOTYPE PATTERN ===\n');

  // Ejemplo 1: Clonar configuración de teléfono
  print('1️⃣ CLONAR CONFIGURACIÓN DE TELÉFONO:\n');

  final configiPhone15 = ConfiguracionTelefonoPrototype(
    nombre: 'iPhone 15 Pro',
    procesador: 'A17 Pro',
    ram: 8,
    almacenamiento: 256,
    pantalla: 6.1,
    sistemaOperativo: 'iOS 17',
    camaras: ['48MP Principal', '12MP Ultra Wide', '12MP Telefoto'],
    bateria: 3274,
  );

  print('Original:');
  configiPhone15.mostrarConfig();

  print('\n\nClon 1 (iPhone 15 Pro Max - con cambios):');
  final cloniPhone15ProMax = configiPhone15.cloneConCambios(
    newNombre: 'iPhone 15 Pro Max',
    newAlmacenamiento: 512,
    newPantalla: 6.7,
  );
  cloniPhone15ProMax.mostrarConfig();

  print('\n\nClon 2 (iPhone 15 - versión básica):');
  final cloniPhone15Basic = configiPhone15.cloneConCambios(
    newNombre: 'iPhone 15',
    newAlmacenamiento: 128,
    newRam: 6,
  );
  cloniPhone15Basic.mostrarConfig();

  print('\n');

  // Ejemplo 2: Usar registro de prototipos
  print('2️⃣ USAR REGISTRO DE PROTOTIPOS:\n');

  final registry = PrototypeRegistry();

  final samsungProto = MarcaPrototype(
    id: 1,
    nombre: 'Samsung',
    pais: 'South Korea',
    descripcion: 'Fabricante de electrónica',
    sitioWeb: 'samsung.com',
  );

  registry.registrar('samsung_base', samsungProto);

  print('\nObtener clon de Samsung:');
  final samsungClon1 = registry.obtenerClon('samsung_base');
  print('   ${samsungClon1.nombre} - ${samsungClon1.pais}');

  print('\nObtener clon con cambios:');
  final xiaomiClon = registry.obtenerClonConCambios('samsung_base', {
    'nombre': 'Xiaomi',
    'pais': 'China',
    'sitioWeb': 'xiaomi.com',
  });
  print('   ${xiaomiClon.nombre} - ${xiaomiClon.pais}');

  print('\n\n3️⃣ CLONAR CARRITO DE COMPRAS:\n');

  final carritoOriginal = CarritoPrototype(
    idCarrito: 'carrito_001',
    items: {
      'iPhone 15': {'cantidad': 2, 'precio': 999.99},
      'Samsung S24': {'cantidad': 1, 'precio': 1299.99},
    },
    total: 3299.97,
    fechaCreacion: DateTime.now(),
  );

  print('Carrito Original:');
  carritoOriginal.mostrarCarrito();

  print('\n\nCarrito Clonado:');
  final carritoClonado = carritoOriginal.clone();
  carritoClonado.mostrarCarrito();

  print('\n\nCarrito Nuevo Vacío (mismo formato):');
  final carritoNuevo = carritoOriginal.cloneVacio();
  carritoNuevo.mostrarCarrito();
}
