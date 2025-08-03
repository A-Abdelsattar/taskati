



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectTaskColor extends StatefulWidget {
  final Function(Color) onChange;
   const SelectTaskColor({super.key, required this.onChange});

  @override
  State<SelectTaskColor> createState() => _SelectTaskColorState();
}

class _SelectTaskColorState extends State<SelectTaskColor> {
  List<Color> colors=[
    Colors.blueAccent,
    Colors.black,
    Colors.red,
    Colors.yellow,
    Colors.black54,
  ];
int activeIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Text("Color",style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 10.h,),
        SizedBox(
          height: 50.h,
          child: ListView.separated(
          scrollDirection: Axis.horizontal
          ,itemBuilder: (context,index)=>    ColorItem(
            backgroundColor: colors[index],
            onTap: (){
             if(activeIndex!=index){
               setState(() {
                 activeIndex=index;
                 widget.onChange(colors[activeIndex]);
               });
             }
            },
            isActive: index==activeIndex,
          )    ,
              separatorBuilder: (context,index)=>SizedBox(width: 10.w,),
              itemCount: colors.length),
        )
      ],
    );
  }
}


class ColorItem extends StatelessWidget {
  final Color? backgroundColor;
  final bool isActive;
  final void Function()? onTap;
  const ColorItem({super.key, this.backgroundColor,this.isActive=false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: backgroundColor,
        child:isActive? Icon(Icons.check,color: Colors.white,):null,
      ),
    );
  }
}
