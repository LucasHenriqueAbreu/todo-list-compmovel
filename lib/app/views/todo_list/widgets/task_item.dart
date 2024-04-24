import 'package:flutter/material.dart';
import 'package:todo/app/models/task.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title),
      leading: Checkbox(
        value: widget.task.isDone, 
        onChanged: (bool? value) { 
          setState(() {
            widget.task.isDone = value ?? false;
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