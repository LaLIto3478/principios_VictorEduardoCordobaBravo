/// Este enum nos ayudará a manejar fácilmente las reacciones en la UI
/// y a enviarle a la API el ID correcto que espera en la base de datos.
enum ReaccionTipo {
  like(1, '👍', 'REACCION_LIKE'),
  corazon(2, '❤️', 'REACCION_CORAZON'),
  risa(3, '😂', 'REACCION_RISA');

  final int id;
  final String emoji;
  final String nombreDb;

  const ReaccionTipo(this.id, this.emoji, this.nombreDb);

  // Un método útil por si la API nos devuelve el nombre en texto y queremos saber qué emoji pintar
  static ReaccionTipo fromNombreDb(String nombre) {
    return ReaccionTipo.values.firstWhere(
          (r) => r.nombreDb == nombre,
      orElse: () => ReaccionTipo.like,
    );
  }
}