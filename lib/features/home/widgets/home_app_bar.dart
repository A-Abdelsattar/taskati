import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello, ahmed",style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold
            ),),
            Text("Have A Nice Day",style: TextStyle(
                fontSize: 17.sp
            ),)
          ],
        ),
        CircleAvatar(
          radius: 35.r,
          backgroundImage: Image.network("https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg").image,
        )
      ],
    );
  }
}
