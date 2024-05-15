import 'package:flutter/material.dart';
import 'package:todo/app/infra/sqlite/task_sqlite_repository.dart';
import 'package:todo/app/models/task.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  final TaskSqliteRepository repository = TaskSqliteRepository();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title),
      leading: Checkbox(
        value: widget.task.isDone, 
        onChanged: (bool? value) { 
          setState(() {
            widget.task.isDone = value ?? false;
            repository.update(widget.task);
          });
        },
      ),
      trailing: widget.task.isDone ? const Icon(
        Icons.done,
        color: Colors.green,
      ) : null,
      subtitle: widget.task.isDone ? 
          const Text('Pronto') : null,
    );
  }
}