// ignore_for_file: non_constant_identifier_names

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/registro.dart';

class Connection {
  String DATABASE_NAME = "tb_historico";
  String CREATE_TABLE_HISTORICO =
      "create table tb_historico (id INTEGER PRIMARY KEY, registro TEXT NOT NULL)";

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

  Future<List<Registro>> getRegistros() async {
    try {
      final Database database = await _getDatabase();
      final List<Map<String, dynamic>> result =
          await database.query(DATABASE_NAME);
      return List.generate(result.length,
          (index) => Registro(result[index]['id'], result[index]['registro']));
    } catch (error) {
      print(error);
      return List.empty();
    }
  }
}
