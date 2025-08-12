import 'package:flutter/material.dart';

import 'package:intl/intl.dart'; 

class TasklistModel {
  final String title;
  final DateTime day;
  final IconData? icon;
  final TimeOfDay time;
  final ImageProvider? image;
  final Color backgroundColor;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  TasklistModel({
    required this.title,
    required this.day,
     this.icon,
    required this.time,
    this.image = const AssetImage('assets/images/dot.png'),
    this.backgroundColor = const Color.fromRGBO(244, 247, 255, 1),
    this.onEdit,
    this.onDelete,
  });

  
  Map<String, dynamic> toJson() {
    return {
      'title': title,
       'day': day.toIso8601String(),
      'timeHour': time.hour,
      'timeMinute': time.minute,

      
    };
  }

  
  factory TasklistModel.fromJson(Map<String, dynamic> json) {
    return TasklistModel(
      title: json['title'],
      day: DateTime.parse(json['day']),
      
      time: TimeOfDay(
        hour: json['timeHour'],
        minute: json['timeMinute'],
      ),
      image: const AssetImage('assets/images/dot.png'), 
    
      onEdit: null,
      onDelete: null,
    );
  }
}