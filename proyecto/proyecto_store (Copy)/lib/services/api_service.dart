import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/marca.dart';
import '../models/telefono.dart';
import '../models/paginated_response.dart';
import '../repositories/api_repository.dart';
import '../models/comentario.dart';

class ApiService implements IApiRepository {
  static final ApiService _instance = ApiService._internal();

  final String baseUrl = 'https://proyecto-apilogin.onrender.com/api';
  late http.Client _httpClient;

  ApiService._internal() {
    _httpClient = http.Client();
  }

  factory ApiService() {
    return _instance;
  }

  static ApiService getInstance(){
    return _instance;
  }

  // ================= MÉTODO AUXILIAR PARA EL TOKEN =================
  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    return {
      'Content-Type': 'application/json; charset=UTF-8',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // =========== MARCAS ==========

  @override
  Future<List<Marca>> fetchMarcas() async {
    try{
     final response = await _httpClient.get(Uri.parse('$baseUrl/marcas'));
     if (response.statusCode == 200) {
       final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
       return PaginatedResponse<Marca>.fromJson(jsonData, Marca.fromJson).content;
     } else {
       throw Exception('Error al obtener las marcas: ${response.statusCode}');
     }
    }catch (e){
      throw Exception('Error al obtener las marcas: $e');
    }
  }

  @override
  Future<Marca> createMarca(Marca marca) async {
    try {
      print('📡 Enviando solicitud para crear marca: ${marca.toJson()}');
      final headers = await _getHeaders(); // Obtenemos las cabeceras con el JWT
      final response = await _httpClient.post(
        Uri.parse('$baseUrl/marcas'),
        headers: headers,
        body: jsonEncode(marca.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Marca.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        print('✅ Marca creada exitosamente: ${marca.toJson()}');
      } else {
        // --- AÑADE ESTE PRINT PARA VER EL ERROR REAL EN LA CONSOLA ---
        print('🚨 ERROR DEL SERVIDOR: Código ${response.statusCode}');
        print('🚨 DETALLE: ${response.body}');
        throw Exception('Error al crear la marca: ${response.statusCode}');
      }
    } catch (e) {
      print('EXCEPCIÓN AL CREAR MARCA: $e');
      throw Exception('Error al crear la marca: $e');
    }
  }

  @override
  Future<void> deleteMarca(int id) async {
    try{
      final headers = await _getHeaders(); // Obtenemos las cabeceras con el JWT
      final response = await _httpClient.delete(
        Uri.parse('$baseUrl/marcas/$id'),
        headers: headers,
      );
      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Error al eliminar la marca: ${response.statusCode}');
      }
    } catch (e){
      throw Exception('Error al eliminar la marca: $e');
    }
  }

  // =========== TELEFONOS ==========

  @override
  Future<List<Telefono>> fetchTelefonos() async {
    try{
     final response = await _httpClient.get(Uri.parse('$baseUrl/telefonos'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        return PaginatedResponse<Telefono>.fromJson(jsonData, Telefono.fromJson).content;
      } else {
        throw Exception('Error al obtener los teléfonos: ${response.statusCode}');
      }
    } catch (e){
      throw Exception('Error al obtener los teléfonos: $e');
    }
  }

  @override
  Future<Telefono> createTelefono(Telefono telefono) async {
    try {
      final headers = await _getHeaders(); // Obtenemos las cabeceras con el JWT
      final response = await _httpClient.post(
        Uri.parse('$baseUrl/telefonos'),
        headers: headers,
        body: jsonEncode(telefono.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Telefono.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception('Error al crear el teléfono: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al crear el teléfono: $e');
    }
  }

  @override
  Future<void> deleteTelefono(int id) async {
    try {
      final headers = await _getHeaders(); // Obtenemos las cabeceras con el JWT
      final response = await _httpClient.delete(
        Uri.parse('$baseUrl/telefonos/$id'),
        headers: headers,
      );
      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Error al eliminar el teléfono: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al eliminar el teléfono: $e');
    }
  }

  // ================= COMENTARIOS =================

  @override
  Future<List<Comentario>> fetchComentarios(int telefonoId) async {
    try {
      // Petición GET pública (no requiere _getHeaders porque lo permitimos en WebSecurityConfig)
      final response = await _httpClient.get(
          Uri.parse('$baseUrl/comentarios/telefono/$telefonoId')
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
        // Reutilizamos tu clase PaginatedResponse que parsea la página de Spring Boot
        return PaginatedResponse<Comentario>.fromJson(jsonData, Comentario.fromJson).content;
      } else {
        throw Exception('Error al cargar los comentarios: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al cargar los comentarios: $e');
    }
  }

  @override
  Future<void> createComentario(int telefonoId, String contenido) async {
    try {
      final headers = await _getHeaders(); // Inyectamos el JWT
      final response = await _httpClient.post(
        Uri.parse('$baseUrl/comentarios'),
        headers: headers,
        body: jsonEncode({
          'telefonoId': telefonoId,
          'contenido': contenido,
        }),
      );

      if (response.statusCode == 401 || response.statusCode == 403) {
        throw Exception('No autorizado. Debes iniciar sesión para comentar.');
      } else if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Error al publicar el comentario: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión al publicar el comentario: $e');
    }
  }

  // ================= REACCIONES =================

  @override
  Future<void> reaccionarTelefono(int telefonoId, int reaccionId) async {
    try {
      final headers = await _getHeaders(); // Inyectamos el JWT
      final response = await _httpClient.post(
        Uri.parse('$baseUrl/reacciones/telefono'),
        headers: headers,
        body: jsonEncode({
          'targetId': telefonoId,
          'reaccionId': reaccionId,
        }),
      );

      if (response.statusCode == 401 || response.statusCode == 403) {
        throw Exception('No autorizado. Debes iniciar sesión para reaccionar.');
      } else if (response.statusCode != 200) {
        throw Exception('Error al enviar la reacción: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión al enviar la reacción: $e');
    }
  }

  @override
  Future<void> reaccionarComentario(int comentarioId, int reaccionId) async {
    try {
      final headers = await _getHeaders(); // Inyectamos el JWT
      final response = await _httpClient.post(
        Uri.parse('$baseUrl/reacciones/comentario'),
        headers: headers,
        body: jsonEncode({
          'targetId': comentarioId,
          'reaccionId': reaccionId,
        }),
      );

      if (response.statusCode == 401 || response.statusCode == 403) {
        throw Exception('No autorizado. Debes iniciar sesión para reaccionar.');
      } else if (response.statusCode != 200) {
        throw Exception('Error al enviar la reacción: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión al enviar la reacción: $e');
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}