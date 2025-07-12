import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/theme/app_colors.dart';


class ProfileScreen extends StatefulWidget {
   ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
   XFile? image;

  selectImageFromGallery()async{
    final ImagePicker picker = ImagePicker();
     image = await picker.pickImage(source: ImageSource.gallery);
     setState(() {

    });
  }

   selectImageFromCamera()async{
     final ImagePicker picker = ImagePicker();
     image = await picker.pickImage(source: ImageSource.camera);
     setState(() {

     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: (context)=>Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 10.h),

                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 60.h),
                                backgroundColor: AppColors.mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r)
                                )
                            )
                            ,onPressed: (){
                              selectImageFromCamera();
                        }, child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("open Camera",style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        )),
                        SizedBox(height: 10.h,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 60.h),
                    
                                backgroundColor: AppColors.mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r)
                                )
                            )
                            ,onPressed: (){
                              selectImageFromGallery();
                              Navigator.pop(context);
                        }, child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("open gallery",style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        )),
                    
                      ],
                    ),
                  ),
                ));
              },
              child: CircleAvatar(
                radius: 60.r,
                backgroundImage: Image.file(File(image?.path??"")).image,
                         child: Align(
                         alignment: Alignment.bottomRight
                         ,child: Container(
               padding: EdgeInsets.all(10.r),
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.black.withValues(alpha: .5)
                 ),
                 child: Icon(Icons.image,color: Colors.white,size: 25.r,))),
              ),
            ),
            SizedBox(height: 40.h,),
            Divider(
              color: AppColors.mainColor,
              endIndent: 40,
              indent: 40,

            ),
            SizedBox(height: 40.h,),
            Row(
              children: [
                Expanded(child: Text("data",maxLines: 2,
                overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22.sp,
                    color: AppColors.mainColor,
                    fontWeight: FontWeight.bold
                  ),
                )),
                Container(
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      border: Border.all(color: AppColors.mainColor,width: 2)
                    ),
                    child: Icon(Icons.mode_edit_outline_outlined,color: AppColors.mainColor,size: 35.r,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
