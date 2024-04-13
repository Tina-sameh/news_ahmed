import 'package:flutter/material.dart';

import '../../model/category.dart';

class AppCategory extends StatelessWidget {
  final Categorys category;
  const AppCategory({super.key,required this.category});
final radius= const Radius.circular(24);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.backgrounfColor,
        borderRadius: BorderRadius.only(
          topRight: radius,
          topLeft: radius,
          bottomLeft: category.isLeftSide?Radius.zero:radius,
          bottomRight: category.isLeftSide?radius:Radius.zero,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(category.imagePath,height: MediaQuery.of(context).size.height*.15,),
          Text(category.title,style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
