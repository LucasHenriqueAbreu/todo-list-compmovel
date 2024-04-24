import 'package:todo/app/models/task.dart';

abstract class TaskRepository {
  Future<void> salvar(Task task);
  Future<List<Task>> buscar();
}