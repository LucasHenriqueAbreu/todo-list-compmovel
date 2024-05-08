import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/app/infra/task_repository.dart';
import 'package:todo/app/models/task.dart';

class TaskSharePreferencesRepository extends TaskRepository {
  @override
  Future<List<Task>> buscar() async  {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? result = sharedPreferences.getStringList('tasks');
    if (result == null) {
      return [];
    }
    return result.map((task) {
      var taskJson = jsonDecode(task);
      return Task.fromMap(taskJson);
    }).toList();
  }

  @override
  Future<void> salvar(String title, bool isDone) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<Task> currentList = await buscar();
    // Lide com isso, estou com preguiça de implementar o id 
    currentList.add(Task(id: 2, title: title, isDone: isDone));
    List<String> listToSave = currentList.map((item) {
      Map<String, dynamic> taskMap = item.toMap();
      return jsonEncode(taskMap);
    }).toList();
    await sharedPreferences.setStringList('tasks',listToSave);
  }
  
}