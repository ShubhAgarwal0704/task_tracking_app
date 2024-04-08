import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  final _mybox = Hive.box('MyBox');

  void createInitData() {
    toDoList = [
      ["1st Task", false],
    ];
  }

  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  void updateDB() {
    _mybox.put("TODOLIST", toDoList);
  }
}
