import 'package:flutter/material.dart';

import 'package:intl/intl.dart'; 

class TasklistModel {
  final String title;
  final DateTime day;
  final IconData icon;
  final TimeOfDay time;
  final ImageProvider image;
  final Color backgroundColor;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  TasklistModel({
    required this.title,
    required this.day,
    required this.icon,
    required this.time,
    required this.image,
    this.backgroundColor = const Color.fromRGBO(244, 247, 255, 1),
    this.onEdit,
    this.onDelete,
  });

  
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'day': day.toIso8601String(),
      'iconCodePoint': icon.codePoint,
      'iconFontFamily': icon.fontFamily,
      'iconFontPackage': icon.fontPackage,
      'timeHour': time.hour,
      'timeMinute': time.minute,
      'backgroundColor': backgroundColor,
      
    };
  }

  
  factory TasklistModel.fromJson(Map<String, dynamic> json) {
    return TasklistModel(
      title: json['title'],
      day: DateTime.parse(json['day']),
      icon: IconData(
        json['iconCodePoint'],
        fontFamily: json['iconFontFamily'],
        fontPackage: json['iconFontPackage'],
      ),
      time: TimeOfDay(
        hour: json['timeHour'],
        minute: json['timeMinute'],
      ),
      image: const AssetImage('assets/images/dot.png'), 
      backgroundColor: Color(json['backgroundColor']),
      onEdit: null,
      onDelete: null,
    );
  }
}
