import 'package:sqflite/sqflite.dart' as sqlite_db;

class DbConfig {
  static final DB_NAME = "products.db";
  static final DB_STORE_PATH = sqlite_db.getDatabasesPath();
  static final DB_CONFLICT_STATEGY = sqlite_db.ConflictAlgorithm.ignore;
  static final TABLE_NAME_PRODUCT = 'product';
}