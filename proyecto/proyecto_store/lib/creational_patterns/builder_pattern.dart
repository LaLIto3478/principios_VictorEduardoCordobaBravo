/// PATRÓN BUILDER
/// 
/// Separa la construcción de un objeto complejo de su representación,
/// permitiendo construir el objeto paso a paso.
/// 
/// Características:
/// - Objeto builder que construye el producto complejo
/// - Métodos fluidos (retornan this) para construcción paso a paso
/// - Método build() que retorna el objeto final
/// - Utilidad: objetos con muchos parámetros opcionales

import '../models/telefono.dart';

/// ============ BUILDER PARA BÚSQUEDA DE TELÉFONOS =============

class TelefonoBuscadorBuilder {
  String? marca;
  double? precioMinimo;
  double? precioMaximo;
  int? añoLanzamiento;
  String? procesador;
  int? ramMin;
  int? almacenamientoMin;
  bool? esRefurbished;
  bool? tieneGarantia;

  /// Setter fluido para marca
  TelefonoBuscadorBuilder conMarca(String marca) {
    this.marca = marca;
    return this;
  }

  /// Setter fluido para rango de precio
  TelefonoBuscadorBuilder conPrecioEntre(double minimo, double maximo) {
    this.precioMinimo = minimo;
    this.precioMaximo = maximo;
    return this;
  }

  /// Setter fluido para precio mínimo
  TelefonoBuscadorBuilder conPrecioMinimo(double precio) {
    this.precioMinimo = precio;
    return this;
  }

  /// Setter fluido para precio máximo
  TelefonoBuscadorBuilder conPrecioMaximo(double precio) {
    this.precioMaximo = precio;
    return this;
  }

  /// Setter fluido para año de lanzamiento
  TelefonoBuscadorBuilder conAñoLanzamiento(int año) {
    this.añoLanzamiento = año;
    return this;
  }

  /// Setter fluido para procesador
  TelefonoBuscadorBuilder conProcesador(String procesador) {
    this.procesador = procesador;
    return this;
  }

  /// Setter fluido para RAM mínima
  TelefonoBuscadorBuilder conRAMMinima(int ram) {
    this.ramMin = ram;
    return this;
  }

  /// Setter fluido para almacenamiento mínimo
  TelefonoBuscadorBuilder conAlmacenamientoMinimo(int almacenamiento) {
    this.almacenamientoMin = almacenamiento;
    return this;
  }

  /// Setter fluido para teléfonos refurbished
  TelefonoBuscadorBuilder soloRefurbished(bool esRefurbished) {
    this.esRefurbished = esRefurbished;
    return this;
  }

  /// Setter fluido para teléfonos con garantía
  TelefonoBuscadorBuilder conGarantia(bool conGarantia) {
    this.tieneGarantia = conGarantia;
    return this;
  }

  /// Construir la búsqueda y retornar los criterios
  BusquedaTelefono build() {
    return BusquedaTelefono(
      marca: marca,
      precioMinimo: precioMinimo,
      precioMaximo: precioMaximo,
      añoLanzamiento: añoLanzamiento,
      procesador: procesador,
      ramMin: ramMin,
      almacenamientoMin: almacenamientoMin,
      esRefurbished: esRefurbished,
      tieneGarantia: tieneGarantia,
    );
  }

  /// Método para mostrar un resumen de la búsqueda
  String obtenerResumen() {
    final criterios = <String>[];
    if (marca != null) criterios.add('Marca: $marca');
    if (precioMinimo != null || precioMaximo != null) {
      criterios.add('Precio: \$${precioMinimo ?? 0} - \$${precioMaximo ?? 999999}');
    }
    if (procesador != null) criterios.add('Procesador: $procesador');
    if (ramMin != null) criterios.add('RAM: ${ramMin}GB+');
    if (almacenamientoMin != null) criterios.add('Almacenamiento: ${almacenamientoMin}GB+');
    if (esRefurbished == true) criterios.add('Refurbished');
    if (tieneGarantia == true) criterios.add('Con Garantía');

    return criterios.isEmpty ? 'Sin criterios' : criterios.join(' | ');
  }
}

/// ============ OBJETO DE BÚSQUEDA CONSTRUIDO =============

class BusquedaTelefono {
  final String? marca;
  final double? precioMinimo;
  final double? precioMaximo;
  final int? añoLanzamiento;
  final String? procesador;
  final int? ramMin;
  final int? almacenamientoMin;
  final bool? esRefurbished;
  final bool? tieneGarantia;

  BusquedaTelefono({
    this.marca,
    this.precioMinimo,
    this.precioMaximo,
    this.añoLanzamiento,
    this.procesador,
    this.ramMin,
    this.almacenamientoMin,
    this.esRefurbished,
    this.tieneGarantia,
  });

  void mostrarCriterios() {
    print('🔍 CRITERIOS DE BÚSQUEDA:');
    if (marca != null) print('   📱 Marca: $marca');
    if (precioMinimo != null || precioMaximo != null) {
      print('   💰 Precio: \$${precioMinimo ?? 0} - \$${precioMaximo ?? 999999}');
    }
    if (procesador != null) print('   ⚙️ Procesador: $procesador');
    if (ramMin != null) print('   🧠 RAM: ${ramMin}GB+');
    if (almacenamientoMin != null) print('   💾 Almacenamiento: ${almacenamientoMin}GB+');
    if (esRefurbished == true) print('   ♻️ Refurbished');
    if (tieneGarantia == true) print('   ✅ Con Garantía');
  }
}

/// ============ BUILDER PARA TELÉFONO PERSONALIZADO =============

class TelefonoPersonalizadoBuilder {
  String _nombre = '';
  double _precio = 0.0;
  String _marca = '';
  String _especificaciones = '';
  int? _cantidad;
  bool _disponible = true;
  String _imagen = '';
  String _descripcion = '';

  TelefonoPersonalizadoBuilder nombre(String nombre) {
    _nombre = nombre;
    return this;
  }

  TelefonoPersonalizadoBuilder precio(double precio) {
    _precio = precio;
    return this;
  }

  TelefonoPersonalizadoBuilder marca(String marca) {
    _marca = marca;
    return this;
  }

  TelefonoPersonalizadoBuilder especificaciones(String specs) {
    _especificaciones = specs;
    return this;
  }

  TelefonoPersonalizadoBuilder cantidad(int cantidad) {
    _cantidad = cantidad;
    return this;
  }

  TelefonoPersonalizadoBuilder disponible(bool disponible) {
    _disponible = disponible;
    return this;
  }

  TelefonoPersonalizadoBuilder imagen(String imagen) {
    _imagen = imagen;
    return this;
  }

  TelefonoPersonalizadoBuilder descripcion(String descripcion) {
    _descripcion = descripcion;
    return this;
  }

  Telefono build() {
    if (_nombre.isEmpty) throw Exception('El nombre es requerido');
    if (_precio <= 0) throw Exception('El precio debe ser mayor a 0');
    if (_marca.isEmpty) throw Exception('La marca es requerida');

    return Telefono(
      id: DateTime.now().millisecondsSinceEpoch,
      nombre: _nombre,
      precio: _precio,
      marca: _marca,
      especificaciones: _especificaciones,
      cantidad: _cantidad,
      disponible: _disponible,
      imagen: _imagen,
      descripcion: _descripcion,
    );
  }

  String obtenerResumen() {
    return 'Teléfono: $_nombre | Precio: \$_precio | Marca: $_marca | Disponible: $_disponible';
  }
}

/// ============ EJEMPLO DE USO =============

void ejemploBuilder() {
  print('\n=== BUILDER PATTERN ===\n');

  // Ejemplo 1: Búsqueda de teléfono con builder
  print('📍 BÚSQUEDA 1: Teléfono Samsung económico con garantía');
  final busqueda1 = TelefonoBuscadorBuilder()
      .conMarca('Samsung')
      .conPrecioMaximo(500)
      .conGarantia(true)
      .build();
  busqueda1.mostrarCriterios();

  print('\n📍 BÚSQUEDA 2: iPhone premium con alta RAM y almacenamiento');
  final busqueda2 = TelefonoBuscadorBuilder()
      .conMarca('Apple')
      .conPrecioMinimo(1000)
      .conRAMMinima(8)
      .conAlmacenamientoMinimo(256)
      .conGarantia(true)
      .build();
  busqueda2.mostrarCriterios();

  print('\n');

  // Ejemplo 2: Crear teléfono personalizado con builder
  print('📱 TELÉFONO PERSONALIZADO 1:');
  final telefono1 = TelefonoPersonalizadoBuilder()
      .nombre('Samsung Galaxy S24 Ultra')
      .precio(1299.99)
      .marca('Samsung')
      .especificaciones('Snapdragon 8 Gen 3, 12GB RAM, 256GB Storage')
      .cantidad(50)
      .disponible(true)
      .descripcion('Último modelo flagship de Samsung')
      .imagen('samsung_s24.jpg')
      .build();

  print('   ${telefono1.nombre}');
  print('   Precio: \$${telefono1.precio}');
  print('   Marca: ${telefono1.marca}');
  print('   Especificaciones: ${telefono1.especificaciones}');

  print('\n📱 TELÉFONO PERSONALIZADO 2:');
  final telefono2 = TelefonoPersonalizadoBuilder()
      .nombre('iPhone 15 Pro')
      .precio(999.99)
      .marca('Apple')
      .especificaciones('A17 Pro, 8GB RAM, 128GB Storage')
      .cantidad(30)
      .disponible(true)
      .imagen('iphone_15_pro.jpg')
      .build();

  print('   ${telefono2.nombre}');
  print('   Precio: \$${telefono2.precio}');
  print('   Marca: ${telefono2.marca}');
  print('   Especificaciones: ${telefono2.especificaciones}');
}
