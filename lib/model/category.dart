import 'package:flutter/material.dart';
import 'package:news_ahmed/ui/collections/appAssets.dart';

import '../ui/collections/appColors.dart';
class Categorys{
  String id;
  String title;
  String imagePath;
  bool isLeftSide;
  Color backgrounfColor;
  Categorys({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.isLeftSide,
    required this.backgrounfColor,
});
  static List<Categorys> categories= [
    Categorys(id: "sports", title: "Sports", imagePath: AppAssets.ball, isLeftSide: true, backgrounfColor: AppColors.red),
    Categorys(id: "technology", title: "Technology", imagePath: AppAssets.politics, isLeftSide: false, backgrounfColor: AppColors.blue),
    Categorys(id: "health", title: "Health", imagePath: AppAssets.health, isLeftSide: true, backgrounfColor: AppColors.pink),
    Categorys(id: "business", title: "Business", imagePath: AppAssets.bussines, isLeftSide: false, backgrounfColor: AppColors.brown),
    Categorys(id: "entertaiment", title: "Entertaiment", imagePath: AppAssets.environment, isLeftSide: true, backgrounfColor: AppColors.blueWhite),
    Categorys(id: "science", title: "Science", imagePath: AppAssets.science, isLeftSide: false, backgrounfColor: AppColors.yellow),
  ];
}