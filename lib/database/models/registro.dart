class Registro {
  int id = 0;
  String registro = "";

  Registro(this.id, this.registro);

  Map<String, dynamic> toMap() {
    return {'id': id, 'registro': registro};
  }
}
