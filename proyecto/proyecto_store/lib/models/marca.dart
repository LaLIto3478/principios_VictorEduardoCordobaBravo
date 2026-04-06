class Marca {
  final int id;
  final String nombre;
  final String imagenUrl;

  Marca({
    required this.id,
    required this.nombre,
    required this.imagenUrl,
  });

  factory Marca.fromJson(Map<String, dynamic> json) {
    return Marca(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
      imagenUrl: json['imagenUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'imagenUrl': imagenUrl,
    };
  }
}