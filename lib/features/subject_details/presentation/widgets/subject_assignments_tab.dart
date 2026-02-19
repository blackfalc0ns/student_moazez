import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../subjects/data/models/subject_model.dart';
import 'package:flutter/widgets.dart';

class SubjectAssignmentsTab extends StatelessWidget {
  final SubjectModel subject;

  const SubjectAssignmentsTab({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 5,
      itemBuilder: (context, index) {
        final bool isCompleted = index > 0;
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: !isCompleted ? subject.color : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: !isCompleted
                            ? subject.backgroundColor
                            : AppColors.lightGrey.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        FontAwesomeIcons.clipboardQuestion,
                        color: !isCompleted
                            ? subject.color
                            : AppColors.textSecondary.withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'واجب الدرس ${index + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: !isCompleted
                                  ? AppColors.textPrimary
                                  : AppColors.textSecondary.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            !isCompleted ? 'مستحق اليوم' : 'تم الانتهاء',
                            style: TextStyle(
                              color: !isCompleted
                                  ? AppColors.error
                                  : AppColors.success,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!isCompleted)
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: subject.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'ابدأ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    else
                      const Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.success,
                        size: 32,
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
