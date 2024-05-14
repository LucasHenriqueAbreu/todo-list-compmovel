import 'package:flutter/material.dart';
import 'package:todo/app/infra/share_preferences/task_share_preferences_repository.dart';
import 'package:todo/app/infra/sqlite/task_sqlite_repository.dart';
import 'package:todo/app/views/register_task/register_task_view.dart';
import 'package:todo/app/views/todo_list/todo_list_controller.dart';
import 'package:todo/app/views/todo_list/widgets/task_item.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final TodoListController _controller = TodoListController(
    repository: TaskSqliteRepository(),
  );

  @override
  void initState() {
    super.initState();
    _buscarTarefas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          goToRegisterTask();
        },
      ),
    );
  }

  void goToRegisterTask() {
    Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (cxt) {
        return RegiserTaskView();
      }),
    ).then((value) async {
      if (value != null && value.isNotEmpty) {
        await _controller.addTask(value, false);
        setState(() {
          _buscarTarefas();
        });
      }
    });
  }

  Widget _buildList() {
    if (_controller.carregando) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: _controller.tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(task: _controller.tasks[index]);
      },
    );
  }
  
  void _buscarTarefas() async {
    setState(() {
      _controller.carregando = true;
    });
    await _controller.buscarTarefas();
    setState(() {
      _controller.carregando = false;
    });
  }
}
