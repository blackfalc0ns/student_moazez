import 'package:flutter/material.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../data/models/grade_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GradeSummaryWidget extends StatelessWidget {
  final double totalEarned;
  final double totalMax;

  const GradeSummaryWidget({
    super.key,
    required this.totalEarned,
    required this.totalMax,
  });

  @override
  Widget build(BuildContext context) {
    final double percentage = (totalEarned / totalMax) * 100;

    GradeRating overallRating;
    if (percentage >= 90) {
      overallRating = GradeRating.excellent;
    } else if (percentage >= 80) {
      overallRating = GradeRating.veryGood;
    } else if (percentage >= 65) {
      overallRating = GradeRating.good;
    } else if (percentage >= 50) {
      overallRating = GradeRating.acceptable;
    } else {
      overallRating = GradeRating.needsImprovement;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: overallRating.color.withOpacity(0.15),
            spreadRadius: 8,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: overallRating.color.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: percentage / 100,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        overallRating.color,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${percentage.toStringAsFixed(1)}%',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: overallRating.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'التقدير العام المبدئي',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      overallRating.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: overallRating.color,
                        height: 1.1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: overallRating.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'المجموع: $totalEarned / $totalMax',
                        style: TextStyle(
                          color: overallRating.color,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: overallRating.color.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.quoteRight,
                  color: overallRating.color.withOpacity(0.5),
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    overallRating.motivationalMessage,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
