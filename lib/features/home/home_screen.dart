import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_colors.dart';
import 'package:taskati/features/home/widgets/date_add_task_row.dart';
import 'package:taskati/features/home/widgets/home_app_bar.dart';
import 'package:taskati/features/home/widgets/task_filter_date.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              DateAddTaskRow(),
              SizedBox(height: 20.h,),
              TaskFilterDate(),
              SizedBox(height: 20.h,),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context,index)=>SizedBox(height: 10.h,),
                  itemCount: 10,
                  itemBuilder: (context,index){
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
                                  Text("Flutter Task - $index",style: TextStyle(
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
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
