import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import '../models/meal.dart';

class DBHelper {
  static final _databaseName = "meals.db";
  static final _databaseVersion = 1;

  static final table = 'user_meals';

  static final columnId = 'id';
  static final columnName = 'name';
  static final columnProtein = 'protein';
  static final columnCarb = 'carb';
  static final columnFat = 'fat';

  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, _databaseName),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $table(id VARCHAR(50) PRIMARY KEY, name VARCHAR(35), protein DOUBLE, carb DOUBLE, fat DOUBLE)');
      },
      version: _databaseVersion,
    );
  }

  static Future<void> insert(String table, Meal meal) async {
    Map<String, dynamic> data = {
      columnId: meal.id,
      columnName: meal.name,
      columnProtein: meal.proteinWeight,
      columnCarb: meal.carbWeight,
      columnFat: meal.fatWeight,
    };
    final db = await DBHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();

    return db.query(table);
  }

  static Future deleteData(String table) async {
    final dbPath = await sql.getDatabasesPath();
    sql.deleteDatabase(
      path.join(dbPath, _databaseName),
    );
  }
}
