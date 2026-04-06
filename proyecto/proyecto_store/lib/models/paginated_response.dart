import 'marca.dart';
import 'telefono.dart';

/// Modelo para representar una respuesta paginada de teléfonos
class PaginatedResponse<Telefono> {
  final List<Telefono> content;

  PaginatedResponse({required this.content});

  factory PaginatedResponse.fromJson(Map<String, dynamic> json, Telefono Function(Map<String, dynamic>) fromJsonTelefono) {
    final contentList = json['content'] as List<dynamic>? ?? [];
    return PaginatedResponse(
        content: contentList.map((item) => fromJsonTelefono(item as Map<String, dynamic>)).toList()
    );
  }
}