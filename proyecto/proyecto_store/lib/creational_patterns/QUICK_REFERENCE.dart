/// QUICK REFERENCE GUIDE
/// Copiar y pegar para usar rápidamente cada patrón

// ============================================================
// 1️⃣ SINGLETON - USO RÁPIDO
// ============================================================

/*

import 'creational_patterns/singleton_pattern.dart';

void ejemploSingletonRapido() {
  // Logger Singleton
  Logger().log('Mensaje de log');
  Logger().log('Otro mensaje');
  print('Total logs: ${Logger().getAllLogs().length}');
  
  // Config Singleton
  ConfigurationManager().set('theme', 'dark');
  print('Theme: ${ConfigurationManager().get('theme')}');
  
  // Cache Singleton
  CacheManager().put('user_id', 123);
  print('Cached user: ${CacheManager().get('user_id')}');
}

*/

// ============================================================
// 2️⃣ FACTORY METHOD - USO RÁPIDO
// ============================================================

/*

import 'creational_patterns/factory_method_pattern.dart';

void ejemploFactoryRapido() {
  // Crear diferentes productos
  final premiumPhone = ProductoFactory.crearProducto(
    tipo: 'premium',
    nombre: 'iPhone 15 Pro',
    precio: 1299.99,
    caracteristicasExtra: 'A17 Pro, 5G, ProMotion',
  );
  
  final budgetPhone = ProductoFactory.crearProducto(
    tipo: 'economico',
    nombre: 'Xiaomi Redmi',
    precio: 299.99,
  );
  
  premiumPhone.mostrarDetalles();
  budgetPhone.mostrarDetalles();
}

*/

// ============================================================
// 3️⃣ ABSTRACT FACTORY - USO RÁPIDO
// ============================================================

/*

import 'creational_patterns/abstract_factory_pattern.dart';

void ejemploAbstractFactoryRapido() {
  // Crear tienda Apple completa
  final appleFactory = MarcaFactoryGenerator.obtenerFactory('apple');
  final tiendaApple = appleFactory.crearTienda('New York');
  final servicioApple = appleFactory.crearServicioTecnico();
  
  tiendaApple.mostrarInfo();
  servicioApple.atenderCliente();
  
  // Crear tienda Samsung completa
  final samsungFactory = MarcaFactoryGenerator.obtenerFactory('samsung');
  final tiendaSamsung = samsungFactory.crearTienda('Madrid');
  final servicioSamsung = samsungFactory.crearServicioTecnico();
  
  tiendaSamsung.mostrarInfo();
  servicioSamsung.atenderCliente();
}

*/

// ============================================================
// 4️⃣ BUILDER - USO RÁPIDO
// ============================================================

/*

import 'creational_patterns/builder_pattern.dart';

void ejemploBuilderRapido() {
  // Búsqueda flexible
  final busqueda = TelefonoBuscadorBuilder()
      .conMarca('Samsung')
      .conPrecioMaximo(500)
      .conRAMMinima(6)
      .conGarantia(true)
      .build();
  
  busqueda.mostrarCriterios();
  
  // Crear teléfono personalizado
  final telefono = TelefonoPersonalizadoBuilder()
      .nombre('Samsung Galaxy S24')
      .precio(899.99)
      .marca('Samsung')
      .especificaciones('Snapdragon 8 Gen 3, 12GB RAM')
      .cantidad(100)
      .disponible(true)
      .build();
  
  print('Teléfono creado: ${telefono.nombre} - \$${telefono.precio}');
}

*/

// ============================================================
// 5️⃣ PROTOTYPE - USO RÁPIDO
// ============================================================

/*

import 'creational_patterns/prototype_pattern.dart';

void ejemploPrototypeRapido() {
  // Crear prototipo
  final configBase = ConfiguracionTelefonoPrototype(
    nombre: 'iPhone Base',
    procesador: 'A17 Pro',
    ram: 8,
    almacenamiento: 256,
    pantalla: 6.1,
    sistemaOperativo: 'iOS 17',
    camaras: ['48MP', '12MP', '12MP'],
    bateria: 3274,
  );
  
  configBase.mostrarConfig();
  
  // Clonar para crear variantes
  final configProMax = configBase.cloneConCambios(
    newNombre: 'iPhone Pro Max',
    newPantalla: 6.7,
    newAlmacenamiento: 512,
  );
  
  print('\n');
  configProMax.mostrarConfig();
  
  // Usar registro de prototipos
  final registry = PrototypeRegistry();
  registry.registrar('iphone_base', configBase);
  
  final clon = registry.obtenerClon('iphone_base');
  print('\nClon desde registro: ${clon.nombre}');
}

*/

// ============================================================
// 🎯 TODAS LAS DEMOSTRACIONES JUNTAS
// ============================================================

/*

import 'creational_patterns/demo.dart';

void main() {
  // Ejecutar TODAS las demostraciones
  demostrarTodosLosPatrones();
  
  // Ver tabla comparativa
  compararPatrones();
  
  // Ver guía de cuándo usar cada patrón
  guiaUso();
  
  // Ver ejemplo integrado (tienda de teléfonos)
  ejemploIntegrado();
}

*/

// ============================================================
// 📋 CASOS DE USO REALES EN PROYECTO
// ============================================================

/*

// 1. Logger para debugging
Logger().log('Producto creado: ${producto.nombre}');

// 2. Factory para crear productos por categoría
final producto = ProductoFactory.crearProducto(
  tipo: usuario.esPremium ? 'premium' : 'economico',
  nombre: productData['name'],
  precio: productData['price'],
);

// 3. Abstract Factory para crear tiendas por marca
final factory = MarcaFactoryGenerator.obtenerFactory(marca.nombre);
final tienda = factory.crearTienda(ubicacion);

// 4. Builder para búsquedas avanzadas en filtros
final busqueda = TelefonoBuscadorBuilder()
    .conMarca(filtro.marca)
    .conPrecioEntre(filtro.minPrice, filtro.maxPrice)
    .conRAMMinima(filtro.ram)
    .conGarantia(filtro.conGarantia)
    .build();

// 5. Prototype para copiar carrito en ofertas
final carritoOferta = carritoOriginal.clone();
carritoOferta.aplicarDescuento(0.20);

*/

// ============================================================
// 🧪 IMPORTAR PARA PRUEBAS
// ============================================================

/*

import 'creational_patterns/singleton_pattern.dart';
import 'creational_patterns/factory_method_pattern.dart';
import 'creational_patterns/abstract_factory_pattern.dart';
import 'creational_patterns/builder_pattern.dart';
import 'creational_patterns/prototype_pattern.dart';
import 'creational_patterns/demo.dart';

*/

// ============================================================
// ✅ CHECKLIST DE IMPLEMENTACIÓN
// ============================================================

/*

✅ 1. Singleton
   - Logger singleton funciona
   - ConfigurationManager singleton funciona
   - CacheManager singleton funciona
   - ApiService original preservado

✅ 2. Factory Method
   - ProductoFactory.crearProducto() funciona
   - Crea Premium, Estándar, Económico
   - ProductoFactory.crearProductoDesdeTelefono() funciona

✅ 3. Abstract Factory
   - MarcaFactoryGenerator obtiene factories
   - AppleFactory crea TiendaApple + ServicioApple
   - SamsungFactory crea TiendaSamsung + ServicioSamsung
   - XiaomiFactory crea TiendaXiaomi + ServicioXiaomi

✅ 4. Builder
   - TelefonoBuscadorBuilder construcción fluida
   - TelefonoPersonalizadoBuilder validación
   - Método build() retorna objeto final
   - Métodos obtenerResumen() funcionan

✅ 5. Prototype
   - ConfiguracionTelefonoPrototype clone() funciona
   - cloneConCambios() permite modificar valores
   - MarcaPrototype clonable
   - CarritoPrototype clonable
   - PrototypeRegistry registra prototipos

✅ 6. Demo y Documentación
   - demo.dart contiene ejemplos ejecutables
   - index.dart guía completa
   - CREATIONAL_PATTERNS.md documentación

*/

// ============================================================
// 🚀 PRÓXIMOS PASOS
// ============================================================

/*

1. Ejecutar: flutter run -v
2. Ver demostraciones en consola
3. Copiar patrones a tus pantallas
4. Integrar en tu UI
5. ¡Usar en producción!

Ejemplo en una pantalla:

import 'creational_patterns/factory_method_pattern.dart';

class ProductoScreen extends StatelessWidget {
  final String tipo; // 'premium', 'estandar', 'economico'
  
  const ProductoScreen({required this.tipo});
  
  @override
  Widget build(BuildContext context) {
    final producto = ProductoFactory.crearProducto(
      tipo: tipo,
      nombre: 'Mi Producto',
      precio: 999.99,
    );
    
    return Column(
      children: [
        Text(producto.nombre),
        Text('\$${producto.precio}'),
        Text('Tipo: ${producto.tipo}'),
      ],
    );
  }
}

*/
