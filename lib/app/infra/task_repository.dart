import 'package:todo/app/models/task.dart';

abstract class TaskRepository {
  Future<void> salvar(String title, bool isDone);
  Future<List<Task>> buscar();
  Future<void> update(Task task);
}