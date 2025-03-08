import 'package:flutter/material.dart';
import 'package:flutter_task_cubit/model/task_model.dart';
import 'package:flutter_task_cubit/repositories/task_repository.dart';


class TaskViewModel extends ChangeNotifier{

 // final TaskRepository repository;

 TaskViewModel({required TaskRepository repository}) : _repository = repository ;
 
 /*
  TaskViewModel(TaskViewModel read, {required TaskRepository repository}) : _repository = repository {
    _initializeTasks();
  }
*/

  final TaskRepository _repository;

List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

 

/*
  Future<void> _initializeTasks() async {
    _tasks.addAll(await _repository.getAllTasks());
    notifyListeners();
  }
  */
  

  Future<List<Task>> addTask(Task task) async {

      await _repository.addTask(task);
      _tasks = _repository.getTasks() as List<Task>;
      notifyListeners();
    return _tasks; 
}


Future<List<Task>> getTasks() async {    
      _tasks = _repository.getTasks() as List<Task>;
      notifyListeners();
    return _tasks; 
}

  void toggleCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();

  }
/*
  Future<List<Task>> removeTask(Task task) async {
    final tasks = await _repository.removeTask(task);
    notifyListeners();
    return tasks;
  }
  */
}