import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import 'base_question_container.dart';

class EssayQuestionWidget extends StatefulWidget {
  final int index;
  const EssayQuestionWidget({super.key, required this.index});

  @override
  State<EssayQuestionWidget> createState() => _EssayQuestionWidgetState();
}

class _EssayQuestionWidgetState extends State<EssayQuestionWidget> {
  final TextEditingController _essayController = TextEditingController();

  @override
  void dispose() {
    _essayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseQuestionContainer(
      questionType: 'سؤال مقالي',
      points: 10,
      questionText:
          '${widget.index}. اشرح باختصار أهمية عملية البناء الضوئي للنباتات؟',
      child: TextField(
        controller: _essayController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'اكتب إجابتك هنا...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
