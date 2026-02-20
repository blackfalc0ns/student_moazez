import 'package:flutter/material.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/common/custom_app_bar.dart';
import '../../../../core/utils/common/custom_button.dart';
import '../../../../core/utils/animations/scroll_animation_widget.dart';
import '../../data/models/homework_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/questions/mcq_question_widget.dart';
import '../widgets/questions/true_false_question_widget.dart';
import '../widgets/questions/essay_question_widget.dart';
import '../widgets/questions/matching_question_widget.dart';
import '../widgets/questions/ordering_question_widget.dart';
import '../widgets/questions/fill_blanks_question_widget.dart';
import '../widgets/questions/file_upload_question_widget.dart';

class HomeworkDetailsScreen extends StatelessWidget {
  final HomeworkModel homework;

  const HomeworkDetailsScreen({super.key, required this.homework});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: CustomAppBar.modern(
        title: 'تفاصيل الواجب',
        subtitle: homework.subjectName,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ScrollAnimationWidget(
                animationType: AnimationType.fadeSlideDown,
                duration: const Duration(milliseconds: 500),
                child: _buildHeaderInfo(),
              ),
              const SizedBox(height: 24),
              ScrollAnimationWidget(
                animationType: AnimationType.fade,
                delay: 200,
                child: _buildSectionTitle(
                  'الأسئلة',
                  FontAwesomeIcons.fileCircleQuestion,
                ),
              ),
              const SizedBox(height: 16),
              // Use StaggeredScrollAnimation to animate all questions appearing smoothly
              StaggeredScrollAnimation(
                startDelay: 300,
                itemDelay: 150,
                animationType: AnimationType.fadeSlideUp,
                children: const [
                  MCQQuestionWidget(index: 1),
                  SizedBox(height: 16),
                  TrueFalseQuestionWidget(index: 2),
                  SizedBox(height: 16),
                  MatchingQuestionWidget(index: 3),
                  SizedBox(height: 16),
                  OrderingQuestionWidget(index: 4),
                  SizedBox(height: 16),
                  FillBlanksQuestionWidget(index: 5),
                  SizedBox(height: 16),
                  EssayQuestionWidget(index: 6),
                  SizedBox(height: 16),
                  FileUploadQuestionWidget(index: 7),
                  SizedBox(height: 32),
                ],
              ),
              ScrollAnimationWidget(
                delay: 1350, // Delay until after questions
                animationType: AnimationType.fadeScale,
                child: _buildSubmitButton(context),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(homework.icon, color: homework.color, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homework.homeworkName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.clock,
                      size: 12,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'أخر موعد للتسليم: غداً, 11:59 م',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                'الدرجة',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              Text(
                homework.grade,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return CustomButton(
      text: 'تسليم الواجب',
      prefix: const Icon(
        FontAwesomeIcons.paperPlane,
        color: Colors.white,
        size: 18,
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'تم تسليم الواجب بنجاح!',
              style: TextStyle(fontFamily: 'Cairo'),
            ),
            backgroundColor: AppColors.success,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.pop(context);
      },
    );
  }
}
