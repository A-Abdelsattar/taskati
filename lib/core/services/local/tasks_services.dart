import 'package:hive_flutter/adapters.dart';
import 'package:taskati/features/home/models/task_model.dart';

import '../../utils/app_constants.dart';

class TasksServices{
  static var tasksBox=Hive.box<TaskModel>(AppConstants.tasksBoxId);
  
  
  static storeTask(TaskModel task){
    tasksBox.add(task);
  }
  
  static getAllTasks(){
    TaskModel.tasks=tasksBox.values.toList();
  }
  
  static deleteTask(int index){
    tasksBox.deleteAt(index);
  }

 static updateTask(TaskModel task,int index){
    task.status="Complete";
    tasksBox.putAt(index, task);

 }
}