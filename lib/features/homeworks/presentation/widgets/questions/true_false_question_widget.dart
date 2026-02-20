import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import 'base_question_container.dart';

class TrueFalseQuestionWidget extends StatefulWidget {
  final int index;
  const TrueFalseQuestionWidget({super.key, required this.index});

  @override
  State<TrueFalseQuestionWidget> createState() =>
      _TrueFalseQuestionWidgetState();
}

class _TrueFalseQuestionWidgetState extends State<TrueFalseQuestionWidget> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return BaseQuestionContainer(
      questionType: 'صح أم خطأ',
      points: 2,
      questionText: '${widget.index}. تُعتبر الشمس كوكباً وليست نجماً.',
      child: Row(
        children: [
          Expanded(child: _buildRadioOption('صح', 0)),
          const SizedBox(width: 16),
          Expanded(child: _buildRadioOption('خطأ', 1)),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String text, int value) {
    bool isSelected = selectedOption == value;
    return GestureDetector(
      onTap: () => setState(() => selectedOption = value),
      child: Container(
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
