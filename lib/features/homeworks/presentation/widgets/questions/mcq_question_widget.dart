import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import 'base_question_container.dart';

class MCQQuestionWidget extends StatefulWidget {
  final int index;
  const MCQQuestionWidget({super.key, required this.index});

  @override
  State<MCQQuestionWidget> createState() => _MCQQuestionWidgetState();
}

class _MCQQuestionWidgetState extends State<MCQQuestionWidget> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return BaseQuestionContainer(
      questionType: 'اختيار من متعدد',
      points: 5,
      questionText: '${widget.index}. ما هو ناتج ضرب 5 في 12 ؟',
      child: Column(
        children: [
          _buildRadioOption('45', 0),
          _buildRadioOption('50', 1),
          _buildRadioOption('60', 2),
          _buildRadioOption('65', 3),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String text, int value) {
    bool isSelected = selectedOption == value;
    return GestureDetector(
      onTap: () => setState(() => selectedOption = value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.grey[400]!,
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
