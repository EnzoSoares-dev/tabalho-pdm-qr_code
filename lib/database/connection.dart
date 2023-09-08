// ignore_for_file: non_constant_identifier_names
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/registro.dart';

class Connection {
  String DATABASE_NAME = "tb_historico";
  String CREATE_TABLE_HISTORICO =
      "create table tb_historico (id INTEGER PRIMARY KEY, registro TEXT NOT NULL, lido INTEGER NOT NULL)";
  String BUSCA_QR_GERADO = "select * from tb_historico where lido = 0";
  String BUSCA_QR_LIDO = "select * from tb_historico where lido = 1";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DATABASE_NAME),
      onCreate: (db, version) {
        return db.execute(CREATE_TABLE_HISTORICO);
      },
      version: 1,
    );
  }

  Future create(Registro registro) async {
    try {
      final Database database = await _getDatabase();
      await database.insert(DATABASE_NAME, registro.toMap());
    } catch (error) {
      print(error);
      return;
    }
  }

  Future<List<Registro>> getRegistrosGerados() async {
    try {
      final Database database = await _getDatabase();
      final List<Map<String, dynamic>> result =
          await database.rawQuery(BUSCA_QR_GERADO);
      return List.generate(
          result.length,
          (index) => Registro(result[index]['id'], result[index]['registro'],
              result[index]['lido']));
    } catch (error) {
      print(error);
      return List.empty();
    }
  }
  Future<List<Registro>> getRegistrosLidos() async {
    try {
      final Database database = await _getDatabase();
      final List<Map<String, dynamic>> result =
          await database.rawQuery(BUSCA_QR_LIDO);
      return List.generate(
          result.length,
          (index) => Registro(result[index]['id'], result[index]['registro'],
              result[index]['lido']));
    } catch (error) {
      print(error);
      return List.empty();
    }
  }
}
