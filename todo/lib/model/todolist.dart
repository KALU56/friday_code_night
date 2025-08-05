import 'package:flutter/widgets.dart';

class TodolistModel {
 String title;
  ImageProvider image;
 Color backgroundColor;
    int count;
   Function() onTap;




  
  TodolistModel(
    {
      required this.title,
      required this.image,
      required this.backgroundColor,
      required this.count,
      required this.onTap,

    }
  )



}
