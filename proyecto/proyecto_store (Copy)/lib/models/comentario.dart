class Comentario {
  final int id;
  final String contenido;
  final String autor;
  final String fechaCreacion;
  final Map<String, int> conteoReacciones;

  Comentario({
    required this.id,
    required this.contenido,
    required this.autor,
    required this.fechaCreacion,
    required this.conteoReacciones,
  });

  factory Comentario.fromJson(Map<String, dynamic> json) {
    // Convertimos el mapa de reacciones que viene de Spring Boot
    // asegurándonos de que los valores sean enteros seguros en Dart.
    Map<String, int> reaccionesParseadas = {};
    if (json['conteoReacciones'] != null) {
      final map = json['conteoReacciones'] as Map<String, dynamic>;
      map.forEach((key, value) {
        reaccionesParseadas[key] = value is int ? value : (value as num).toInt();
      });
    }

    return Comentario(
      id: json['id'] ?? 0,
      contenido: json['contenido'] ?? '',
      autor: json['autor'] ?? 'Anónimo',
      fechaCreacion: json['fechaCreacion'] ?? '',
      conteoReacciones: reaccionesParseadas,
    );
  }
}