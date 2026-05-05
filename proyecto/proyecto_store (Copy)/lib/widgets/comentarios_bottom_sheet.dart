import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/comentario.dart';
import '../models/reaccion_tipo.dart';

class ComentariosBottomSheet extends StatefulWidget {
  final int telefonoId;

  const ComentariosBottomSheet({super.key, required this.telefonoId});

  @override
  State<ComentariosBottomSheet> createState() => _ComentariosBottomSheetState();
}

class _ComentariosBottomSheetState extends State<ComentariosBottomSheet> {
  final ApiService _apiService = ApiService.getInstance();
  final TextEditingController _comentarioController = TextEditingController();

  List<Comentario> _comentarios = [];
  bool _isLoading = true;
  bool _isPosting = false;

  @override
  void initState() {
    super.initState();
    _cargarComentarios();
  }

  Future<void> _cargarComentarios() async {
    setState(() => _isLoading = true);
    try {
      final comentarios = await _apiService.fetchComentarios(widget.telefonoId);
      setState(() {
        _comentarios = comentarios;
      });
    } catch (e) {
      _mostrarMensaje('Error al cargar comentarios: ${e.toString().replaceAll('Exception: ', '')}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _publicarComentario() async {
    if (_comentarioController.text.trim().isEmpty) return;

    setState(() => _isPosting = true);
    try {
      await _apiService.createComentario(widget.telefonoId, _comentarioController.text.trim());
      _comentarioController.clear();
      FocusScope.of(context).unfocus(); // Oculta el teclado
      await _cargarComentarios(); // Recargamos la lista para ver el nuevo
      _mostrarMensaje('Comentario publicado');
    } catch (e) {
      _mostrarMensaje(e.toString().replaceAll('Exception: ', ''));
    } finally {
      setState(() => _isPosting = false);
    }
  }

  Future<void> _reaccionarComentario(int comentarioId, int reaccionId) async {
    try {
      await _apiService.reaccionarComentario(comentarioId, reaccionId);
      await _cargarComentarios(); // Recargamos para ver los conteos actualizados
    } catch (e) {
      _mostrarMensaje(e.toString().replaceAll('Exception: ', ''));
    }
  }

  void _mostrarMensaje(String mensaje) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  void dispose() {
    _comentarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tomamos el 80% del alto de la pantalla para el modal
    final height = MediaQuery.of(context).size.height * 0.8;

    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Barra superior (Handle) y Título
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Comentarios', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),

          // Lista de comentarios
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _comentarios.isEmpty
                ? const Center(child: Text('Sé el primero en comentar', style: TextStyle(color: Colors.grey)))
                : ListView.builder(
              itemCount: _comentarios.length,
              itemBuilder: (context, index) {
                final comentario = _comentarios[index];
                return _buildComentarioItem(comentario);
              },
            ),
          ),

          // Caja de texto para comentar
          Container(
            padding: EdgeInsets.only(
              left: 16, right: 16, top: 8,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16, // Espacio para el teclado
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _comentarioController,
                    decoration: InputDecoration(
                      hintText: 'Escribe un comentario...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    maxLines: null,
                  ),
                ),
                const SizedBox(width: 8),
                _isPosting
                    ? const Padding(padding: EdgeInsets.all(12.0), child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)))
                    : IconButton(
                  icon: Icon(Icons.send, color: Theme.of(context).colorScheme.primary),
                  onPressed: _publicarComentario,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComentarioItem(Comentario comentario) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                child: Text(comentario.autor[0].toUpperCase(), style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 14)),
              ),
              const SizedBox(width: 8),
              Text(comentario.autor, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(comentario.contenido, style: const TextStyle(fontSize: 15)),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              children: ReaccionTipo.values.map((tipo) {
                final count = comentario.conteoReacciones[tipo.nombreDb] ?? 0;
                return InkWell(
                  onTap: () => _reaccionarComentario(comentario.id, tipo.id),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Text(tipo.emoji, style: const TextStyle(fontSize: 16)),
                        if (count > 0) ...[
                          const SizedBox(width: 4),
                          Text(count.toString(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ]
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 4),
          const Divider(),
        ],
      ),
    );
  }
}