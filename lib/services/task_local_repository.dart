

import 'package:flutter_task_cubit/model/task_model.dart';
import 'package:flutter_task_cubit/database/objectbox.g.dart';
import 'package:flutter_task_cubit/repositories/task_repository.dart';



class TaskLocalRepository implements TaskRepository {
 

  late final Box<Task> taskBox;

  @override
   Future<List<Task>> addTask(Task task) async {
       taskBox.put(task);
     return  taskBox.getAll();
  }
  @override
  Future<Task?> getTask(int id) async {
         
   return taskBox.get(id); 
  }

@override
  Future<List<Task>> getTasks() async{
           
   return taskBox.getAll();
  }

  @override
  Future<List<Task>> saveTask(Task task) async {
     taskBox.put(task);

    return taskBox.getAll();
  }

 @override
  Future<List<Task>> removeTask(int id)  async {
     taskBox.remove(id);
      
    return taskBox.getAll();
  }
}


