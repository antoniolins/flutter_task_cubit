


import 'dart:io';

import 'package:flutter_task_cubit/model/task_model.dart';
import 'package:flutter_task_cubit/database/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store _store;
  late final Box<Task> _taskBox;

  static ObjectBox? _instance;

  ObjectBox._init(this._store) {
    _taskBox = Box<Task>(_store);
 
  }
  static Future<ObjectBox> init() async {
    if (_instance != null) {
      return _instance!;
    } else {
      final dir = await getApplicationDocumentsDirectory();
      final storePath = p.join(dir.path, "boxDB");

      // Check if the store is already open
      try {
        // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
        final store = await openStore(getObjectBoxModel() as Directory, directory: storePath);
        _instance = ObjectBox._init(store);
      } catch (e) {
        final store = Store.attach(getObjectBoxModel(), storePath);
        _instance = ObjectBox._init(store);
      }
      return _instance!;
    }
  }
// other code
}