import 'package:flutter/material.dart';
import 'package:flutter_task_cubit/model/task_model.dart';
import 'package:flutter_task_cubit/repositories/task_repository.dart';


class TaskViewModel extends ChangeNotifier{

  TaskViewModel(TaskViewModel read, {required TaskRepository repository}) : _repository = repository {
    _initializeTasks();
  }

  final TaskRepository _repository;

  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> _initializeTasks() async {
    _tasks.addAll(await _repository.getAllTasks());
    notifyListeners();
  }

  Future<List<Task>> addTask(Task task) async {
    final tasks = await _repository.addTask(task);
    notifyListeners();
    return tasks;
  }

Future<List<Task>> getAllTasks() async {
  return _repository.getAllTasks();
}

  void toggleCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  Future<List<Task>> removeTask(Task task) async {
    final tasks = await _repository.removeTask(task);
    notifyListeners();
    return tasks;
  }
}