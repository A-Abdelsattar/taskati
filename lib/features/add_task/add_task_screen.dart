


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/theme/app_colors.dart';
import 'package:taskati/features/add_task/widgets/select_task_color.dart';
import 'package:taskati/features/add_task/widgets/text_form_field_with_title.dart';

class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({super.key});

  var validationKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.mainColor,
        ),
        centerTitle: true,
        title: Text("Add Task",style: TextStyle(fontSize: 18.sp,color: AppColors.mainColor,
        fontFamily: "NotoSerif",
        fontWeight: FontWeight.bold
        ),),

      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(right: 20.0.w,left: 20.w,bottom: 30.h),
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r)
          )
        )
        ,onPressed: (){
          validationKey.currentState?.validate();
        }, child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Create Task",style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
        )),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Form(
          key: validationKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15.h,
            children: [
              TextFormFieldWithTitle(
                title: "Title",
                hintText: "Enter title",
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "Tile is required";
                  }
                },
              ),
              TextFormFieldWithTitle(
                title: "Description",
                hintText: "Enter Description",
                maxLine: 5,
                validator: (value){
                  if(value==null||value.isEmpty){
                    return "des is required";
                  }
                },
              ),
              TextFormFieldWithTitle(
                title: "Date",
                hintText: "12-5-2020",
                suffixIcon: Icon(Icons.date_range),
                onTap: (){
                  showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030));
                },
              ),
              Row(
                children: [
                  Expanded(child: TextFormFieldWithTitle(
                    onTap: (){
                      showTimePicker(context: context, initialTime: TimeOfDay.now());
                    },
                    title: "Start Time",
                    hintText: "12:00 PM",
                    suffixIcon: Icon(Icons.timelapse),
                  ),),
                  SizedBox(width: 10.w,),
                  Expanded(child: TextFormFieldWithTitle(
                    onTap: (){
                      showTimePicker(context: context, initialTime: TimeOfDay.now());
                    },
                    title: "End Time",
                    hintText: "12:00 PM",
                    suffixIcon: Icon(Icons.timelapse),
                  ),),
                ],
              ),
              SelectTaskColor()
            ],
          ),
        ),
      ),
    );
  }
}
