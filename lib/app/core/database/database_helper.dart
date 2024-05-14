import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._contructor();
  Database? _database;
  static DatabaseHelper instance = DatabaseHelper._contructor();

  Future<Database> get database async {
    _database ??= await _getConnection();
    if (_database == null) {
      throw Exception('Não foi possível estabelecer uma conexão');
    }
    return _database!;
  }

  Future<Database> _getConnection() {
    return openDatabase('todo.db', version: 1, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        isDone BOOLEAN
      );
    ''');
  }
}

