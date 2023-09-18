class NoNetwork implements Exception {
  String title;
  String message;
  NoNetwork({
    this.title = "Sin conexión",
    this.message =
        "Error al conectar, verifique su conexión a internet",
  }) {
    title = title;
    message = message;
  }
}
