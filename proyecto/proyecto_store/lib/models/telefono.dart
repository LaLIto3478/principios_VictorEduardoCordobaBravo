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
  });

  factory Telefono.fromJson(Map<String, dynamic> json) {
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