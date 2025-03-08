
import 'package:flutter_task_cubit/model/task_model.dart';
import 'package:flutter_task_cubit/services/task_local_repository.dart';


abstract class TaskRepository {

//late final TaskLocalRepository localRepository;

  TaskRepository({
    
    required TaskLocalRepository localRepository 
    })  : _localRepository = localRepository;


 
late final TaskLocalRepository _localRepository;

Future <List<Task>> addTask(Task task) async {   
         await _localRepository.addTask(task);
  return await _localRepository.getTasks();
  
  }

  Future<Task?> getTask(int id) async {
     
  return await _localRepository.getTask(id);
  }

  Future<List<Task>> getTasks() async {
    return await _localRepository.getTasks();
  }

  Future<List<Task>> saveTask(Task task) async {
     
         _localRepository.addTask(task);
  return await _localRepository.getTasks();

    // Create a task in the database
  }

   Future<List<Task>> removeTask(int id) async {
      return await _localRepository.getTasks();
    }

/*
    Future<List<Task>> removeTask(Task task) async {
      await _localRepository.removeTask(task);
      return await _localRepository.getAllTasks();
    }
*/

}
