import 'package:flutter/material.dart';

enum HomeworkStatus { completed, waiting, notCompleted }

class HomeworkModel {
  final String id;
  final String subjectName;
  final String homeworkName;
  final String grade;
  final HomeworkStatus status;
  final Color color;
  final IconData icon;
  final int studentsCount;
  final List<String> studentAvatars;

  HomeworkModel({
    required this.id,
    required this.subjectName,
    required this.homeworkName,
    required this.grade,
    required this.status,
    required this.color,
    required this.icon,
    required this.studentsCount,
    required this.studentAvatars,
  });
}
