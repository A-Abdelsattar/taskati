

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskati/core/utils/app_constants.dart';
import 'package:taskati/features/home/models/task_model.dart';
import 'package:taskati/features/profile/models/user_model.dart';
import 'package:taskati/taskati_app.dart';

void main()async{


  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(UserModelAdapter());

  await Hive.openBox<TaskModel>(AppConstants.tasksBoxId);
  await Hive.openBox<UserModel>(AppConstants.userBoxId);

  runApp(TaskatiApp());
}