import 'package:todo/app/infra/task_repository.dart';
import 'package:todo/app/models/task.dart';

class TodoListController {
  final TaskRepository repository;
  List<Task> _tasks = [];
  bool carregando = false;

  TodoListController({required this.repository});

  get tasks => _tasks;

  Future<void> addTask(String title, bool isDone) async {
    await repository.salvar(title, isDone);
  }
  
  Future<void> buscarTarefas() async {
    _tasks = await repository.buscar();
    print(_tasks);
  }
}