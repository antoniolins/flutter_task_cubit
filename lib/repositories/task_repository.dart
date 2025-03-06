// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_task_cubit/model/task_model.dart';
import 'package:flutter_task_cubit/services/task_local_service.dart';


abstract class TaskRepository {

  late final TaskLocalRepository localRepository;

  TaskRepository(this.localRepository);

  Future<List<Task>> addTask(Task task);
  Future<List<Task>> saveTask(Task task);
  Future<List<Task>> getAllTasks();
  Future<List<Task>> removeTask(Task task);
}


late final TaskLocalRepository _localRepository ;

Future<List<Task>> addTask(Task task) async {
     
         await _localRepository.addTask(task);
  return await _localRepository.getAllTasks();
    // Create a task in the database
  }

    Future<List<Task>> saveTask(Task task) async {
     
         _localRepository.addTask(task);
      return await _localRepository.getAllTasks();

    // Create a task in the database
  }
    Future<List<Task>> getAllTasks() async {
      return await _localRepository.getAllTasks();
    }

    Future<List<Task>> removeTask(Task task) async {
      await _localRepository.removeTask(task);
      return await _localRepository.getAllTasks();
    }


