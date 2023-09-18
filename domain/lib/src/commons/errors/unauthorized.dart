class Unauthorized implements Exception {
  String title;
  String message;
  Unauthorized({
    this.title = "Sin autorización",
    this.message = "No tienes acceso para realizar esta acción",
  }) {
    title = title;
    message = message;
  }
}
