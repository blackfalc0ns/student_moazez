import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum BehaviorType { attendance, absence, lateness, positive, negative }

extension BehaviorTypeExtension on BehaviorType {
  String get name {
    switch (this) {
      case BehaviorType.attendance:
        return 'حضور';
      case BehaviorType.absence:
        return 'غياب';
      case BehaviorType.lateness:
        return 'تأخير';
      case BehaviorType.positive:
        return 'إشادة';
      case BehaviorType.negative:
        return 'مخالفة';
    }
  }

  Color get color {
    switch (this) {
      case BehaviorType.attendance:
        return Colors.green;
      case BehaviorType.absence:
        return Colors.red;
      case BehaviorType.lateness:
        return Colors.orange;
      case BehaviorType.positive:
        return Colors.blue;
      case BehaviorType.negative:
        return Colors.redAccent;
    }
  }

  IconData get icon {
    switch (this) {
      case BehaviorType.attendance:
        return FontAwesomeIcons.userCheck;
      case BehaviorType.absence:
        return FontAwesomeIcons.userXmark;
      case BehaviorType.lateness:
        return FontAwesomeIcons.userClock;
      case BehaviorType.positive:
        return FontAwesomeIcons.award;
      case BehaviorType.negative:
        return FontAwesomeIcons.triangleExclamation;
    }
  }
}

class BehaviorRecord {
  final String id;
  final BehaviorType type;
  final String title;
  final String date;
  final int points;
  final String? note;

  BehaviorRecord({
    required this.id,
    required this.type,
    required this.title,
    required this.date,
    required this.points,
    this.note,
  });
}
