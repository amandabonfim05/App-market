import 'package:app_mercado/config/db/db_config.dart';
import 'package:sqflite/sqflite.dart' as sqlite_db;
import 'package:path/path.dart' as path;

class SqliteDbAction {

  static Future<sqlite_db.Database> init_state() async {
    final path_future = await DbConfig.DB_STORE_PATH;
    final real_path = path.join(path_future, DbConfig.DB_NAME);

    return sqlite_db.openDatabase(
      real_path, onCreate: (db, version) {
        return db.execute('CREATE TABLE ${DbConfig.TABLE_NAME_PRODUCT} (id TEXT PRIMARY KEY, name TEXT, price TEXT, amount TEXT)');
      }, version: 1
    );
  }

  static void adicionar_registro(String t, Map<String, Object> row) async {
    final sqlite_db = await SqliteDbAction.init_state();

    await sqlite_db.insert(t, row,
        conflictAlgorithm: DbConfig.DB_CONFLICT_STATEGY);
  }

  static void atualizar_registro(String t, Map<String, Object> row) async {
    final sqlite_db = await SqliteDbAction.init_state();

    await sqlite_db.update(t, row);
  }

  static void remover_registro(String t, String id) async {
    final sqlite_db = await SqliteDbAction.init_state();

    await sqlite_db.rawDelete(
        'DELETE FROM ${DbConfig.TABLE_NAME_PRODUCT} WHERE ID == ${id}');
  }

}

