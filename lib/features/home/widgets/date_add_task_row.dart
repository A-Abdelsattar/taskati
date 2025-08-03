import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_colors.dart';
import 'package:taskati/features/add_task/add_task_screen.dart';



class DateAddTaskRow extends StatelessWidget {
  final void Function()? onTap;
  const DateAddTaskRow({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("october, 30,2020\nToDay",style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold
        ),),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(12.r)
            ),
            child: Row(
              children: [
                Icon(Icons.add,color: Colors.white,),
                Text("Add Task",style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white
                ),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
