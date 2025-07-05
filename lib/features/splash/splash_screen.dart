

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskati/features/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds:1),(){

     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset("assets/images/splash_logo.gif",

            ),
            SizedBox(height: 20.h,),
            Text("Taskati",style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30.h,),
            Text("it's time to get organized",
            style: TextStyle(
              fontSize: 17.sp,

            ),

            ),
          ],
        ),
      ),
    );
  }
}
