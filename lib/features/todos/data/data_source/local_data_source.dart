import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_udevs/features/todos/domain/entity/todo/todo.dart';

sealed class SqlDatabase {
  static const dbName = 'todo_database.db';
  static late final Future<Database> database;

  static Future<void> init() async {
    String pathDirectory = await getDatabasesPath();
    String path = join(pathDirectory, dbName);

    database = openDatabase(path, onCreate: _onCreate, version: 1);
  }

  static Future<void> _onCreate(Database db, int version) {
    return db.execute(
      'CREATE TABLE todos(id INTEGER PRIMARY KEY, name TEXT, description TEXT, location TEXT, time TEXT, colorCode INTEGER)',
    );
  }

  static Future<void> insert(Todo todo) async {
    final db = await database;

    await db.insert(
      'todos',
      todo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> update(Todo todo) async {
    final db = await database;

    await db.update(
      'todos',
      todo.toJson(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  static Future<List<Todo>> readAll() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('todos');

    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
        location: maps[i]['location'],
        colorCode: maps[i]['colorCode'],
        time: maps[i]['time'],
      );
    });
  }


  static Future<void> delete(int id) async {
    final db = await database;

    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
