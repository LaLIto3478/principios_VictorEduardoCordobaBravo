import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth_response.dart';

class AuthService {
  // ATENCIÓN: Cambia esta URL por la de tu API en Render
  final String baseUrl = 'https://proyecto-apilogin.onrender.com/api/auth';

  Future<AuthResponse> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signin'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final authResponse = AuthResponse.fromJson(data);

        // Guardamos el token JWT de forma segura en el dispositivo
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', authResponse.token);
        await prefs.setString('username', authResponse.username);

        return authResponse;
      } else {
        throw Exception('Usuario o contraseña incorrectos');
      }
    } catch (e) {
      throw Exception('Error de conexión al servidor');
    }
  }

  // --- NUEVO MÉTODO DE REGISTRO ---
  Future<void> signup(String username, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'role': ['user'] // Asignamos el rol básico por defecto
        }),
      );

      if (response.statusCode != 200) {
        final errorData = jsonDecode(response.body);
        throw Exception(errorData['message'] ?? 'Error al registrar usuario');
      }
    } catch (e) {
      rethrow;
    }
  }

  // Método auxiliar para cerrar sesión después
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
    await prefs.remove('username');
  }
}