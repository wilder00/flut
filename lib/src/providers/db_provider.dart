//creando un singleton

import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;

  /// el `DBProvider._();` es una instancia con un contructor privado como ._private()
  static final DBProvider db = DBProvider._();

  ///constructor privado
  DBProvider._();

  Future<Database> get Database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {}
}
