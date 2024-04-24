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
  Future<void> salvar(Task task) async {
    await Future.delayed(const Duration(seconds: 2));
    _tasks.add(task);
  }

}