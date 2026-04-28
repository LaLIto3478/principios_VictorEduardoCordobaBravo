/// PATRÓN FACTORY METHOD
///
/// Define una interfaz para crear objetos, pero permite que las subclases
/// decidan qué clase instanciar.
///
/// Características:
/// - Interfaz abstracta o clase abstracta
/// - Factory method abstracto
/// - Implementaciones concretas de las subclases
/// - Utilidad: crear productos sin especificar sus clases exactas

import '../models/telefono.dart';

/// ============ INTERFACES =============

/// Interfaz para diferentes tipos de productos
abstract class Producto {
  String get nombre;
  double get precio;
  String get tipo;
  void mostrarDetalles();
}

/// ============ IMPLEMENTACIONES CONCRETAS =============

/// Producto tipo Premium
class ProductoPremium implements Producto {
  @override
  final String nombre;
  @override
  final double precio;
  final String caracteristicasExtra;

  ProductoPremium({
    required this.nombre,
    required this.precio,
    required this.caracteristicasExtra,
  });

  @override
  String get tipo => 'Premium';

  @override
  void mostrarDetalles() {
    print('🌟 PRODUCTO PREMIUM');
    print('   Nombre: $nombre');
    print('   Precio: \$$precio');
    print('   Características Extra: $caracteristicasExtra');
  }
}

/// Producto tipo Estándar
class ProductoEstandar implements Producto {
  @override
  final String nombre;
  @override
  final double precio;

  ProductoEstandar({required this.nombre, required this.precio});

  @override
  String get tipo => 'Estándar';

  @override
  void mostrarDetalles() {
    print('📱 PRODUCTO ESTÁNDAR');
    print('   Nombre: $nombre');
    print('   Precio: \$$precio');
  }
}

/// Producto tipo Económico
class ProductoEconomico implements Producto {
  @override
  final String nombre;
  @override
  final double precio;

  ProductoEconomico({required this.nombre, required this.precio});

  @override
  String get tipo => 'Económico';

  @override
  void mostrarDetalles() {
    print('💰 PRODUCTO ECONÓMICO');
    print('   Nombre: $nombre');
    print('   Precio: \$$precio');
  }
}

/// ============ FACTORY =============

/// Factory Method para crear productos según el tipo
class ProductoFactory {
  /// Factory method que retorna diferentes tipos de productos
  static Producto crearProducto({
    required String tipo,
    required String nombre,
    required double precio,
    String caracteristicasExtra = '',
  }) {
    switch (tipo.toLowerCase()) {
      case 'premium':
        return ProductoPremium(
          nombre: nombre,
          precio: precio,
          caracteristicasExtra: caracteristicasExtra,
        );
      case 'estandar':
        return ProductoEstandar(nombre: nombre, precio: precio);
      case 'economico':
        return ProductoEconomico(nombre: nombre, precio: precio);
      default:
        throw Exception('Tipo de producto desconocido: $tipo');
    }
  }

  /// Factory method sobrecargado para crear desde un Telefono
  static Producto crearProductoDesdeTelefono(Telefono telefono) {
    if (telefono.precio > 1000) {
      return ProductoPremium(
        nombre: telefono.nombre,
        precio: telefono.precio,
        caracteristicasExtra: 'Especificaciones: ${telefono.especificaciones}',
      );
    } else if (telefono.precio > 500) {
      return ProductoEstandar(nombre: telefono.nombre, precio: telefono.precio);
    } else {
      return ProductoEconomico(
        nombre: telefono.nombre,
        precio: telefono.precio,
      );
    }
  }
}

/// ============ EJEMPLO DE USO =============

void ejemploFactoryMethod() {
  // Creamos diferentes tipos de productos sin conocer sus clases exactas
  final productoPremium = ProductoFactory.crearProducto(
    tipo: 'premium',
    nombre: 'iPhone 15 Pro Max',
    precio: 1299.99,
    caracteristicasExtra: '5G, Pantalla ProMotion, Cámara 48MP',
  );

  final productoEstandar = ProductoFactory.crearProducto(
    tipo: 'estandar',
    nombre: 'Samsung Galaxy A54',
    precio: 549.99,
  );

  final productoEconomico = ProductoFactory.crearProducto(
    tipo: 'economico',
    nombre: 'Xiaomi Redmi Note 12',
    precio: 299.99,
  );

  print('\n=== FACTORY METHOD PATTERN ===\n');
  productoPremium.mostrarDetalles();
  print('');
  productoEstandar.mostrarDetalles();
  print('');
  productoEconomico.mostrarDetalles();
}
