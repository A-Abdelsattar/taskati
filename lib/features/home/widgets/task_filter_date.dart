


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_colors.dart';

class TaskFilterDate extends StatelessWidget {
  const TaskFilterDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DateFilterItem(
          isActive: true,
        ),
        SizedBox(width: 5.w,),
        DateFilterItem(),
        SizedBox(width: 5.w,),

        DateFilterItem(),
        SizedBox(width: 5.w,),

        DateFilterItem(),
      ],
    );
  }
}


class DateFilterItem extends StatelessWidget {
  final bool isActive;
  const DateFilterItem({super.key,  this.isActive=false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
        decoration: BoxDecoration(
          color:isActive? AppColors.mainColor:Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Text("OCT",style: TextStyle(
              fontSize: 18.sp,
              color:isActive? Colors.white:Colors.black
            ),),
            SizedBox(height:5.h),
            Text("30",style: TextStyle(
                fontSize: 18.sp,
                color:isActive? Colors.white:Colors.black
            )),
            SizedBox(height:5.h),
            Text("MON",style: TextStyle(
                fontSize: 18.sp,
                color:isActive? Colors.white:Colors.black
            )),
          ],
        ),
      ),
    );
  }
}
