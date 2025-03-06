import 'package:flutter/material.dart';
import 'package:flutter_task_cubit/provaiders.dart';


import 'package:flutter_task_cubit/view/task_screen.dart';
import 'package:provider/provider.dart';


// ignore: depend_on_referenced_packages

// import 'package:timeago/timeago.dart' as timeago;

// -----------------------------------------------------



void main() async {


   WidgetsFlutterBinding.ensureInitialized();


  runApp(

    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}
