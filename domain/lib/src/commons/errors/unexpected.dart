class Unexpected implements Exception {
  String title;
  String message;
  Unexpected({
    this.title = "Error inesperado",
    this.message =
        "Ocurrió un error desconocido, por favor vuelve a intentarlo",
  }) {
    title = title;
    message = message;
  }
}
