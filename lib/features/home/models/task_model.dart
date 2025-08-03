import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)

class TaskModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String startTime;
  @HiveField(2)
  final String endTime;
  @HiveField(3)
  final String des;
  @HiveField(4)
  String status;
  @HiveField(5)
  final int  taskColor;

  TaskModel({required this.title,
    required this.startTime,
    required this.endTime,
    required this.des,
    required this.status,
  required this.taskColor
  });


static String timeFormat(context,TimeOfDay time){
    final localizations = MaterialLocalizations.of(context);
    final formattedTimeOfDay = localizations.formatTimeOfDay(time);
    return formattedTimeOfDay.toString();
  }

 static List<TaskModel> tasks=[

  ];





}