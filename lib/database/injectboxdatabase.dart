import 'package:flutter_task_cubit/objectbox.g.dart';

  class ObjectBoxDatabase {
  Store? _store;

  Future<Store> getStore() async {
    return _store ??= await openStore();
  }
}
/*
class ObjectBox {
  late final Store _store;
  late final Box<User> _userBox;

  ObjectBox._init(this._store) {
    _userBox = Box<User>(_store);
  }

*/
