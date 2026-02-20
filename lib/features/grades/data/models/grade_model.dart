import 'package:flutter/material.dart';

enum GradeRating {
  excellent, // امتياز
  veryGood, // جيد جداً
  good, // جيد
  acceptable, // مقبول
  needsImprovement, // يحتاج تحسين
}

extension GradeRatingExtension on GradeRating {
  String get name {
    switch (this) {
      case GradeRating.excellent:
        return 'امتياز';
      case GradeRating.veryGood:
        return 'جيد جداً';
      case GradeRating.good:
        return 'جيد';
      case GradeRating.acceptable:
        return 'مقبول';
      case GradeRating.needsImprovement:
        return 'دون المستوى';
    }
  }

  Color get color {
    switch (this) {
      case GradeRating.excellent:
        return Colors.green;
      case GradeRating.veryGood:
        return Colors.teal;
      case GradeRating.good:
        return Colors.blue;
      case GradeRating.acceptable:
        return Colors.orange;
      case GradeRating.needsImprovement:
        return Colors.red;
    }
  }

  String get motivationalMessage {
    switch (this) {
      case GradeRating.excellent:
        return 'عمل رائع! أنت من الأوائل والتميز يليق بك، استمر يا بطل! 🌟';
      case GradeRating.veryGood:
        return 'مجهود مميز جداً! اقتربت من القمة، واصل العمل الرائع! 💪';
      case GradeRating.good:
        return 'أداء جيد، لكننا نثق أن لديك قدرات أكبر لتصل للأفضل! 📚';
      case GradeRating.acceptable:
        return 'لقد اجتزت! بقليل من التركيز والمذاكرة ستكون في المقدمة! 🎯';
      case GradeRating.needsImprovement:
        return 'لا تيأس! كل تعثر هو بداية لنجاح جديد. نحن هنا لدعمك لتكون أفضل! ❤️';
    }
  }
}

class GradeBreakdown {
  final String title;
  final double earned;
  final double total;

  GradeBreakdown({
    required this.title,
    required this.earned,
    required this.total,
  });
}

class SubjectGradeModel {
  final String id;
  final String subjectName;
  final IconData icon;
  final Color color;
  final double totalMarks;
  final double earnedMarks;
  final List<GradeBreakdown> breakdown; // Details like Month 1, Month 2, Final

  SubjectGradeModel({
    required this.id,
    required this.subjectName,
    required this.icon,
    required this.color,
    required this.totalMarks,
    required this.earnedMarks,
    required this.breakdown,
  });

  double get percentage => (earnedMarks / totalMarks) * 100;

  GradeRating get rating {
    if (percentage >= 90) return GradeRating.excellent;
    if (percentage >= 80) return GradeRating.veryGood;
    if (percentage >= 65) return GradeRating.good;
    if (percentage >= 50) return GradeRating.acceptable;
    return GradeRating.needsImprovement;
  }
}
