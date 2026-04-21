class Marca {
  final int id;
  final String nombre;
  final String imagenUrl;
  final String? createdBy;

  Marca({
    required this.id,
    required this.nombre,
    required this.imagenUrl,
    this.createdBy
  });

  factory Marca.fromJson(Map<String, dynamic> json) {
    return Marca(
      id: json['id'] ?? 0,
      nombre: json['nombre'] ?? '',
      imagenUrl: json['imagenUrl'] ?? '',
      createdBy: json['createdBy'] ?? null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'imagenUrl': imagenUrl,
    };
  }
}