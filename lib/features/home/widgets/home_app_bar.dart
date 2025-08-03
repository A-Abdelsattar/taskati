import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/core/services/local/user_services.dart';
import 'package:taskati/features/profile/profile_screen.dart';

import '../../../core/theme/app_colors.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, ${UserServices.getUSerData().name??""}",style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold
            ),),
            Text("Have A Nice Day",style: TextStyle(
                fontSize: 17.sp
            ),)
          ],
        ),
        InkWell(
          onTap: ()async{
            await Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
          setState(() {

          });
            },
          child: CircleAvatar(
            radius: 35.r,
            backgroundImage: Image.file(File(UserServices.getUSerData().image)).image,
          ),
        )
      ],
    );
  }
}
