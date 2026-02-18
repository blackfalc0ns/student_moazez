import 'package:flutter/material.dart';

class SubjectModel {
  final String id;
  final String name;
  final int lessonsCount;
  final Color color;
  final Color backgroundColor;

  SubjectModel({
    required this.id,
    required this.name,
    required this.lessonsCount,
    required this.color,
    required this.backgroundColor,
  });
}
