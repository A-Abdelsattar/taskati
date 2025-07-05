import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';



class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.separated(
        separatorBuilder: (context,index)=>SizedBox(height: 10.h,),
        itemCount: 10,
        itemBuilder: (context,index){
          return Dismissible(
              key: UniqueKey(),
              child: TaskItem());
        },
      ),
    );
  }
}


class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w,
          vertical: 15.h
      ),
      decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(12.r)
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Flutter Task -",style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10.h,),
                  Row(children: [
                    Icon(Icons.alarm_add,color: Colors.white,),
                    SizedBox(width: 5.w,),
                    Text("02:03 AM - 03:33 PM",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.white,
                        )
                    )
                  ],),
                  SizedBox(height: 10.h,),

                  Text("i will do this task",style: TextStyle(
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
              child: Text("ToDo",style: TextStyle(

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
