import 'package:todo/app/infra/task_repository.dart';
import 'package:todo/app/models/task.dart';

class TaskRepositoryMemory extends TaskRepository {
  final List<Task> _tasks = [];
  @override
  Future<List<Task>> buscar() async {
    await Future.delayed(const Duration(seconds: 2));
    return _tasks;
  }

  @override
  Future<void> salvar(String title, bool isDone) async {
    await Future.delayed(const Duration(seconds: 2));
    var task = Task(id: _tasks.length + 1, title: title, isDone: isDone);
    _tasks.add(task);
  }

}