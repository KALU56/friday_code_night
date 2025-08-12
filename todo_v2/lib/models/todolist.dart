import 'package:flutter/material.dart';

class TodolistModel {
  final String title;
  final ImageProvider image;
  final Color backgroundColor;
  int count;
  final VoidCallback? onTap;

  TodolistModel({
    required this.title,
    required this.image,
    required this.backgroundColor,
    this.count = 0,
    this.onTap,
  });
}