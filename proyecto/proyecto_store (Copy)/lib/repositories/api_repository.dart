import '../models/marca.dart';
import '../models/telefono.dart';
import '../models/comentario.dart';

abstract class IApiRepository {
  Future<List<Marca>> fetchMarcas();
  Future<Marca> createMarca(Marca marca);
  Future<void> deleteMarca(int id);

  Future<List<Telefono>> fetchTelefonos();
  Future<Telefono> createTelefono(Telefono telefono);
  Future<void> deleteTelefono(int id);

  Future<List<Comentario>> fetchComentarios(int telefonoId);
  Future<void> createComentario(int telefonoId, String contenido);
  Future<void> reaccionarTelefono(int telefonoId, int reaccionId);
  Future<void> reaccionarComentario(int comentarioId, int reaccionId);

  void dispose();
}