import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'models/marca.dart';
import 'models/telefono.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const PhoneStoreApp());
}

class PhoneStoreApp extends StatelessWidget {
  const PhoneStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhonePedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.teal,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LoginScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ApiService _apiService;

  List<Marca> _marcas = [];
  List<Telefono> _telefonos = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _apiService = ApiService();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    try {
      final marcas = await _apiService.fetchMarcas();
      final telefonos = await _apiService.fetchTelefonos();
      setState(() {
        _marcas = marcas;
        _telefonos = telefonos;
      });
    } catch (e) {
      _showErrorSnackBar('Error al cargar datos: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red),
      );
    }
  }

  void _showSuccessSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.green),
      );
    }
  }

  // ================= INTERFAZ PRINCIPAL =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.phone_android),
            SizedBox(width: 8),
            Text('PhonePedia', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _marcas.isEmpty
          ? const Center(child: Text('No hay marcas registradas. Añade una para empezar.'))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _marcas.length,
        itemBuilder: (context, index) {
          final marca = _marcas[index];
          final telefonosDeMarca = _telefonos.where((t) => t.marca.id == marca.id).toList();

          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            margin: const EdgeInsets.only(bottom: 16),
            child: ExpansionTile(
              shape: const Border(),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(marca.imagenUrl),
                onBackgroundImageError: (_, __) => const Icon(Icons.image_not_supported),
                radius: 25,
              ),
              title: Text(
                  marca.nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
              ),
              minTileHeight: 80,
              children: telefonosDeMarca.isEmpty
                  ? [const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('No hay teléfonos para esta marca.', style: TextStyle(color: Colors.grey)),
              )]
                  : telefonosDeMarca.map((t) => _buildPhoneCard(t)).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddOptionsModal,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }

  // ================= TARJETA DEL TELÉFONO =================

  Widget _buildPhoneCard(Telefono telefono) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del teléfono
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey[100],
              child: Image.network(
                telefono.imagenUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        telefono.modelo,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => _deleteTelefono(telefono.id),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  telefono.descripcion,
                  style: TextStyle(color: Colors.grey[700], height: 1.5),
                ),
                const SizedBox(height: 16),
                _buildSpecRow(Icons.memory, Colors.blue[100]!, Colors.blue, 'Procesador', telefono.procesador),
                _buildSpecRow(Icons.smartphone, Colors.purple[100]!, Colors.purple, 'Pantalla', telefono.pantalla),
                _buildSpecRow(Icons.camera_alt, Colors.pink[100]!, Colors.pink, 'Cámaras', '${telefono.numeroCamaras} cámaras'),
                _buildSpecRow(Icons.battery_full, Colors.green[100]!, Colors.green, 'Batería', '${telefono.bateriaMah} mAh'),
                _buildSpecRow(Icons.calendar_today, Colors.orange[100]!, Colors.orange, 'Lanzamiento', telefono.fechaSalida),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSpecRow(IconData icon, Color bgColor, Color iconColor, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= MODALES Y FORMULARIOS =================

  void _showAddOptionsModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Agregar nuevo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                ],
              ),
              const SizedBox(height: 16),
              _buildModalOption(
                title: 'Agregar marca',
                subtitle: 'Crear una nueva marca de teléfonos',
                color: Colors.blue[50]!,
                borderColor: Colors.blue[200]!,
                onTap: () {
                  Navigator.pop(context);
                  _showAddMarcaDialog();
                },
              ),
              const SizedBox(height: 12),
              _buildModalOption(
                title: 'Agregar teléfono',
                subtitle: 'Añadir un teléfono a una marca existente',
                color: Colors.purple[50]!,
                borderColor: Colors.purple[200]!,
                onTap: () {
                  Navigator.pop(context);
                  if (_marcas.isEmpty) {
                    _showErrorSnackBar('Primero debes crear al menos una marca.');
                    return;
                  }
                  _showAddTelefonoDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModalOption({required String title, required String subtitle, required Color color, required Color borderColor, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  void _showAddMarcaDialog() {
    final nombreController = TextEditingController();
    final imagenController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nueva marca'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nombreController, decoration: const InputDecoration(labelText: 'Nombre de la marca', hintText: 'Ej: OnePlus', border: OutlineInputBorder())),
              const SizedBox(height: 16),
              TextField(controller: imagenController, decoration: const InputDecoration(labelText: 'URL del logo', hintText: 'https://ejemplo.com/logo.png', border: OutlineInputBorder())),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Atrás')),
            ElevatedButton(
              onPressed: () async {
                if (nombreController.text.isEmpty || imagenController.text.isEmpty) {
                  _showErrorSnackBar('Todos los campos son obligatorios');
                  return;
                }
                Navigator.pop(context);
                setState(() => _isLoading = true);
                try {
                  await _apiService.createMarca(Marca(id: 0, nombre: nombreController.text, imagenUrl: imagenController.text));
                  _showSuccessSnackBar('Marca agregada correctamente');
                  _loadData();
                } catch (e) {
                  _showErrorSnackBar('Error: $e');
                  setState(() => _isLoading = false);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary, foregroundColor: Colors.white),
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  void _showAddTelefonoDialog() {
    Marca? marcaSeleccionada = _marcas.isNotEmpty ? _marcas.first : null;
    final modeloController = TextEditingController();
    final imagenController = TextEditingController();
    final descripcionController = TextEditingController();
    final procesadorController = TextEditingController();
    final pantallaController = TextEditingController();
    final camarasController = TextEditingController();
    final bateriaController = TextEditingController();
    final fechaController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (context, setStateDialog) {
              return AlertDialog(
                title: const Text('Nuevo teléfono'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<Marca>(
                        value: marcaSeleccionada,
                        decoration: const InputDecoration(labelText: 'Marca', border: OutlineInputBorder()),
                        items: _marcas.map((m) => DropdownMenuItem(value: m, child: Text(m.nombre))).toList(),
                        onChanged: (val) => setStateDialog(() => marcaSeleccionada = val),
                      ),
                      const SizedBox(height: 16),
                      TextField(controller: modeloController, decoration: const InputDecoration(labelText: 'Modelo', hintText: 'Ej: iPhone 16 Pro', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: imagenController, decoration: const InputDecoration(labelText: 'URL de la imagen', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: descripcionController, maxLines: 3, decoration: const InputDecoration(labelText: 'Descripción', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: procesadorController, decoration: const InputDecoration(labelText: 'Procesador', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: pantallaController, decoration: const InputDecoration(labelText: 'Pantalla', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: camarasController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Número de Cámaras', hintText: 'Ej: 3', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: bateriaController, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Batería (mAh)', hintText: 'Ej: 5000', border: OutlineInputBorder())),
                      const SizedBox(height: 16),
                      TextField(controller: fechaController, decoration: const InputDecoration(labelText: 'Fecha de salida', hintText: 'Ej: 2024-01-15', border: OutlineInputBorder())),
                    ],
                  ),
                ),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context), child: const Text('Atrás')),
                  ElevatedButton(
                    onPressed: () async {
                      if (marcaSeleccionada == null || modeloController.text.isEmpty || camarasController.text.isEmpty || bateriaController.text.isEmpty) {
                        _showErrorSnackBar('Por favor llena los campos principales de manera correcta.');
                        return;
                      }
                      Navigator.pop(context);
                      setState(() => _isLoading = true);
                      try {
                        final nuevoTel = Telefono(
                          modelo: modeloController.text,
                          imagenUrl: imagenController.text,
                          descripcion: descripcionController.text,
                          procesador: procesadorController.text,
                          pantalla: pantallaController.text,
                          numeroCamaras: int.tryParse(camarasController.text) ?? 1,
                          bateriaMah: int.tryParse(bateriaController.text) ?? 0,
                          fechaSalida: fechaController.text,
                          marca: marcaSeleccionada!,
                        );
                        await _apiService.createTelefono(nuevoTel);
                        _showSuccessSnackBar('Teléfono agregado correctamente');
                        _loadData();
                      } catch (e) {
                        _showErrorSnackBar('Error: $e');
                        setState(() => _isLoading = false);
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.primary, foregroundColor: Colors.white),
                    child: const Text('Agregar'),
                  ),
                ],
              );
            }
        );
      },
    );
  }

  // ================= FUNCIONALIDAD DE BORRAR =================

  Future<void> _deleteTelefono(int id) async {
    setState(() => _isLoading = true);
    try {
      await _apiService.deleteTelefono(id);
      _showSuccessSnackBar('Teléfono eliminado');
      _loadData();
    } catch (e) {
      _showErrorSnackBar('Error al eliminar: $e');
      setState(() => _isLoading = false);
    }
  }
}