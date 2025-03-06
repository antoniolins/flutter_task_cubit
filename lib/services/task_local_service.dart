

import 'package:flutter_task_cubit/database/injectboxdatabase.dart';
import 'package:flutter_task_cubit/model/task_model.dart';
import 'package:flutter_task_cubit/repositories/task_repository.dart';
import 'package:objectbox/objectbox.dart';


class TaskLocalRepository implements TaskRepository {
  @override
  TaskLocalRepository get localRepository => this;

  @override
  set localRepository(TaskLocalRepository repository) {
    // You can add any necessary logic here
  }
  
  TaskLocalRepository({required ObjectBoxDatabase database}) : _database = database; 

   // TaskLocalRepository({ 
   //  required ObjectBoxDatabase database}) : _database = database;

  late final ObjectBoxDatabase _database;
  

  Future<Box> getBox() async {
    final store = await _database.getStore();
    return store.box<Task>();
  }

  @override

  Future<List<Task>> addTask(Task task) async {
    final box = await getBox();
    task.id = box.put(task);
    return getAllTasks();
  }
  

   @override
  Future<List<Task>> getAllTasks() async {
    final box = await getBox();
    final tasks = box.getAll() as List<Task>;
    return tasks;
  }
  @override
  Future<List<Task>> saveTask(Task task) async {
    final box = await getBox();
    task.id = box.put(task);
    return getAllTasks();
  }

  @override
  Future<List<Task>> removeTask(Task task) async {
    final box = await getBox();
    box.remove(task.id);
     return getAllTasks();
  }
  
 
}

    