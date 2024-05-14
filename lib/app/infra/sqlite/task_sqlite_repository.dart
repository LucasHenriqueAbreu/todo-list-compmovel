import 'package:sqflite/sqlite_api.dart';
import 'package:todo/app/core/database/database_helper.dart';
import 'package:todo/app/infra/task_repository.dart';
import 'package:todo/app/models/task.dart';

class TaskSqliteRepository extends TaskRepository {
  @override
  Future<List<Task>> buscar() async {
    Database db = await DatabaseHelper.instance.database;
    var results = await db.rawQuery('SELECT * FROM todo;');
    return results.map((e) {
      final task = Task.fromMap(e);
      return task;
    }).toList();
  }

  @override
  Future<void> salvar(String title, bool isDone) async {
    Database db = await DatabaseHelper.instance.database;
    await db.rawInsert(
      'INSERT INTO todo(title, isDone) VALUES(?, ?)',
      [title, isDone],
    );
  }
  
  @override
  Future<void> update(Task task) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
