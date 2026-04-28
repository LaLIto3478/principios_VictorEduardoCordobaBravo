import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/marca.dart';
import '../models/telefono.dart';
import '../models/paginated_response.dart';
import '../repositories/api_repository.dart';

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

  @override
  void dispose() {
    _httpClient.close();
  }
}