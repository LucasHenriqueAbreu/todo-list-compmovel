import 'package:sqflite/sqlite_api.dart';
import 'package:todo/app/core/database/database_helper.dart';
import 'package:todo/app/infra/task_repository.dart';
import 'package:todo/app/models/task.dart';

class TaskSqliteRepository extends TaskRepository {
  @override
  Future<List<Task>> buscar() async {
    Database db = await DatabaseHelper.instance.database;
    var results = await db.rawQuery('SELECT * FROM todo;');
    return results.map((e) => Task.fromMap(e)).toList();
    // Faz a mesma coisa que a linha acima, porém, 
    // de maneira mais verbosa
    // List<Task> tasks = [];
    // for (var i = 0; i < results.length; i++) {
    //   var result = results[i];
    //   var task = Task.fromMap(result);
    //   tasks.add(task);
    // }
    // return tasks;
  }

  @override
  Future<void> salvar(String title, bool isDone) {
    // TODO: implement salvar
    throw UnimplementedError();
  }

}