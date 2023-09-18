class BadRequest implements Exception {
  String title;
  String message;
  BadRequest(
      {this.title = 'Ocurrio un problema',
      this.message =
          "Ocurrió un problema, verifique que su solicitud sea válida"}) {
    title = title;
    message = message;
  }
}
