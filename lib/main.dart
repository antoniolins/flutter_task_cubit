import 'package:flutter/material.dart';
import 'package:flutter_task_cubit/database/injectboxdatabase.dart';

import 'package:flutter_task_cubit/services/task_local_repository.dart';

import 'package:flutter_task_cubit/taskviewmodel/taskviewmodel.dart';
import 'package:flutter_task_cubit/view/task_screen.dart';
import 'package:provider/provider.dart';




// ignore: depend_on_referenced_packages

// import 'package:timeago/timeago.dart' as timeago;

// -----------------------------------------------------


late ObjectBox objectboxDB;

Future <void> main() async {  

    WidgetsFlutterBinding.ensureInitialized();
     objectboxDB = await ObjectBox.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
          Provider<ObjectBox>(
         create: (context) => objectboxDB,
 
       ),

        ChangeNotifierProvider<TaskViewModel>(

          create: (context) => TaskViewModel(repository: TaskLocalRepository()),
          
          ),       
        
      ],
      child: MaterialApp(
        title: 'Task App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const TaskScreen(),
      ),
    );  
  }
}



