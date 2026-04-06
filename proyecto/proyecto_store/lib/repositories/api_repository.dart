import '../models/marca.dart';
import '../models/telefono.dart';

abstract class IApiRepository {
  Future<List<Marca>> fetchMarcas();
  Future<Marca> createMarca(Marca marca);
  Future<void> deleteMarca(int id);

  Future<List<Telefono>> fetchTelefonos();
  Future<Telefono> createTelefono(Telefono telefono);
  Future<void> deleteTelefono(int id);

  void dispose();
}