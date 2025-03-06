// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';


@Entity()

class Task {
    int id = 0;

    String? title;
    bool isCompleted = false;
    
  Task({
    this.id = 0 ,
    this.title,
    this.isCompleted = false,
  });
  
}
