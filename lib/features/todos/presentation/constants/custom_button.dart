import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/presentation/constants/styles.dart';

class CustomButton extends StatelessWidget {
  void Function()? onTap;
  final double height;
  final double width;
  final Color color;
  final Widget widget;



   CustomButton({super.key,required this.onTap,required this.width, this.height=60,this.color=Styles.c009fee,required this.widget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        height: height,
        width: width,
        child: widget
        // isDelete?Column(children: [Icon(CupertinoIcons.delete_solid,color: Colors.red),Text(text,style: Styles.ts14regular.copyWith(color: Colors.white),)]):Text(text,style: Styles.ts14semibold.copyWith(color: Colors.white),)




      ),

    );
  }
}
