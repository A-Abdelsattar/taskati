


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';



class TextFormFieldWithTitle extends StatelessWidget {
   final String title;
   final String hintText;
   final int maxLine;
   final Icon? suffixIcon;
   final String? Function(String?)? validator;
   final void Function()? onTap;
   const TextFormFieldWithTitle({super.key, required this.title, required this.hintText,  this.maxLine=1, this.suffixIcon, this.validator, this.onTap});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10.h,),
        TextFormField(
          onTap:onTap ,
          readOnly: onTap!=null,
          cursorColor: AppColors.mainColor,
          keyboardType: TextInputType.number,
          maxLines:maxLine,
          validator: validator,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r)),

            focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.mainColor),
                borderRadius: BorderRadius.circular(12.r)
            ) ,
            hintStyle: TextStyle(
              fontSize: 18.sp,
            ),
            hintText: hintText,

          ),
        )
      ],
    );
  }
}
