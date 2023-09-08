class Registro {
  int id = 0;
  String registro = "";
  int lido = 0;

  Registro(this.id, this.registro,this.lido);

  Map<String, dynamic> toMap() {
    return {'id': id, 'registro': registro, 'lido':lido};
  }
}
