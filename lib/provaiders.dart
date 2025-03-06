
import 'package:flutter_task_cubit/database/injectboxdatabase.dart';
import 'package:flutter_task_cubit/repositories/task_repository.dart';
import 'package:flutter_task_cubit/taskviewmodel/taskviewmodel.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[

  
  Provider<ObjectBoxDatabase>(
    create: (context) => ObjectBoxDatabase(),
  ),

  Provider<TaskViewModel>(
    create: (context) => TaskViewModel(
      context.read<TaskViewModel>(), repository: context.read<TaskRepository>(),
  ),

  ),


];