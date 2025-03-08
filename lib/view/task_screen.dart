import 'package:flutter/material.dart';
import 'package:flutter_task_cubit/model/task_model.dart';
import 'package:flutter_task_cubit/taskviewmodel/taskviewmodel.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {

  const TaskScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final taskviewmodel = Provider.of<TaskViewModel>(context);


    Future<List<Task>> _tasksFuture = taskviewmodel.getTasks();


    TextEditingController _controller = TextEditingController(text: '');
    final FocusNode focusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Task List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Task>>(
              future: _tasksFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No tasks available'));
                } else {
                  final tasks = snapshot.data!;
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Card(
                        margin: const EdgeInsets.only(
                          top: 10,
                          left: 12,
                          right: 12,
                          bottom: 0,
                        ),
                        child: ListTile(
                          title: Text(
                            task.title ?? 'No Title',
                            style: TextStyle(
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  task.isCompleted
                                      ? Icons.check_circle
                                      : Icons.circle,
                                  color: task.isCompleted
                                      ? Colors.green
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  taskviewmodel.toggleCompletion(task);
                                },
                              ),
                              IconButton(
                                onPressed: () {
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0),
          
          child: TextField(
                   controller: _controller,
                   focusNode: focusNode,
                   autofocus: true,
                  decoration: InputDecoration(
                  
                  
                  labelText: 'Add Task',   
                  border: const OutlineInputBorder(),
                 ),
                onSubmitted: (value) {
                  Provider.of<TaskViewModel>(context, listen: false);
                 
                  taskviewmodel.addTask(Task(title: value));
                  

                  _controller.clear();
                  focusNode.unfocus();  
                  _controller.value = TextEditingValue(text: '');
               
       
                 
                },
               ),
              ),  
          ],
       ),
    );

  }
}
