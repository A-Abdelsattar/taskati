import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart' show Hive;
import 'package:taskati/core/theme/app_colors.dart';
import 'package:taskati/features/home/models/task_model.dart';
import 'package:taskati/features/home/widgets/date_add_task_row.dart';
import 'package:taskati/features/home/widgets/home_app_bar.dart';
import 'package:taskati/features/home/widgets/task_filter_date.dart';
import 'package:taskati/features/home/widgets/tasks_list_view.dart';

import '../../core/services/local/user_services.dart';
import '../add_task/add_task_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    UserServices.getUSerData();
    TaskModel.tasks=Hive.box<TaskModel>("Tasks").values.toList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              HomeAppBar(),
              SizedBox(height: 20.h,),
              DateAddTaskRow(
                onTap: ()async{
                  await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
                  setState(() {

                  });
                },
              ),
              SizedBox(height: 20.h,),
              TaskFilterDate(),
              SizedBox(height: 20.h,),
              TasksListView()

            ],
          ),
        ),
      ),
    );
  }
}
