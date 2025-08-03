import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/services/local/tasks_services.dart';
import 'package:taskati/features/home/models/task_model.dart';





class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  Widget build(BuildContext context) {
    return TaskModel.tasks.isEmpty?Column(
      children: [
        Image.asset("assets/images/empty_tasks.png"),
        Text("you don't have any task yet!",style: TextStyle(
          fontSize: 18.sp,
          color: Colors.grey
        ),),
      ],
    ) : Expanded(
      child: ListView.separated(
        separatorBuilder: (context,index)=>SizedBox(height: 10.h,),
        itemCount: TaskModel.tasks.length,
        itemBuilder: (context,index){
          return Dismissible(
              key: UniqueKey(),
              confirmDismiss: (direction)async{
                if(direction ==DismissDirection.startToEnd){
                 setState(() {
                   TasksServices.updateTask(TaskModel.tasks[index], index);
                   TaskModel.tasks[index].status="Complete";
                 });
                }else{
                setState(() {
                  TaskModel.tasks.remove(TaskModel.tasks[index]);
                  TasksServices.deleteTask(index);

                });
                }
              },
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.green,
                child: Text("Complete Task",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white
                ),
                ),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: Text("Remove",style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white
                ),),
              ),
              child: TaskItem(
                taskModel: TaskModel.tasks[index],
              ));
        },
      ),
    );
  }
}


class TaskItem extends StatelessWidget {
  final TaskModel taskModel;
  const TaskItem({super.key, required this.taskModel,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,
          vertical: 15.h
      ),
      decoration: BoxDecoration(
          color: Color(taskModel.taskColor),
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskModel.title,style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10.h,),
                  Row(children: [
                    Icon(Icons.alarm_add,color: Colors.white,),
                    SizedBox(width: 5.w,),
                    Text("${taskModel.startTime}  - ${taskModel.endTime}",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                        )
                    )
                  ],),
                  SizedBox(height: 10.h,),

                  Text(taskModel.des,style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),)
                ],
              ),
            ),
            VerticalDivider(
              color: Colors.white,
              width: 20,
              thickness: 2,
              endIndent: 2,
            ),

            RotatedBox(
              quarterTurns: 3,
              child: Text(taskModel.status,style: TextStyle(

                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
