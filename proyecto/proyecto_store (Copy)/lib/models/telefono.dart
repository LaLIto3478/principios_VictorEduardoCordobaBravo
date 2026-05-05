import 'marca.dart';

class Telefono {
  final int id;
  final String modelo;
  final String imagenUrl;
  final String descripcion;
  final String procesador;
  final String pantalla;
  final int numeroCamaras;
  final int bateriaMah;
  final String fechaSalida;
  final Marca marca;
  final String? createdBy;
  final Map<String, int> conteoReacciones;

  Telefono({
    this.id = 0, // por defecto 0, se asignará el ID real al guardar en la base de datos
    required this.modelo,
    required this.imagenUrl,
    required this.descripcion,
    required this.procesador,
    required this.pantalla,
    required this.numeroCamaras,
    required this.bateriaMah,
    required this.fechaSalida,
    required this.marca,
    this.createdBy,
    required this.conteoReacciones,
  });

  factory Telefono.fromJson(Map<String, dynamic> json) {
    // --- NUEVA LÓGICA DE PARSEO ---
    Map<String, int> reaccionesParseadas = {};
    if (json['conteoReacciones'] != null) {
      final map = json['conteoReacciones'] as Map<String, dynamic>;
      map.forEach((key, value) {
        reaccionesParseadas[key] = value is int ? value : (value as num).toInt();
      });
    }
    return Telefono(
      id: json['id'] ?? 0,
      modelo: json['modelo'] ?? '',
      imagenUrl: json['imagenUrl'] ?? '',
      descripcion: json['descripcion'] ?? '',
      procesador: json['procesador'] ?? '',
      pantalla: json['pantalla'] ?? '',
      numeroCamaras: json['numeroCamaras'] ?? 0,
      bateriaMah: json['bateriaMah'] ?? 0,
      fechaSalida: json['fechaSalida'] ?? '',
      marca: Marca.fromJson(json['marca'] ?? {}),
      createdBy: json['createdBy'] ?? null,
     conteoReacciones: reaccionesParseadas,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'modelo': modelo,
      'imagenUrl': imagenUrl,
      'descripcion': descripcion,
      'procesador': procesador,
      'pantalla': pantalla,
      'numeroCamaras': numeroCamaras,
      'bateriaMah': bateriaMah,
      'fechaSalida': fechaSalida,
      'marca': {'id': marca.id} , // Solo enviamos el ID de la marca
    };
  }
  }