import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import 'base_question_container.dart';

class FillBlanksQuestionWidget extends StatefulWidget {
  final int index;
  const FillBlanksQuestionWidget({super.key, required this.index});

  @override
  State<FillBlanksQuestionWidget> createState() =>
      _FillBlanksQuestionWidgetState();
}

class _FillBlanksQuestionWidgetState extends State<FillBlanksQuestionWidget> {
  final TextEditingController _blank1 = TextEditingController();
  final TextEditingController _blank2 = TextEditingController();

  @override
  void dispose() {
    _blank1.dispose();
    _blank2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseQuestionContainer(
      questionType: 'أكمل الفراغات',
      points: 4,
      questionText:
          '${widget.index}. اقرأ الجملة وأكمل الفراغات بالكلمة المناسبة:',
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          runSpacing: 12,
          children: [
            const Text(
              'عاصمة جمهورية مصر العربية هي',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 100,
              height: 35,
              child: TextField(
                controller: _blank1,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 8,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.secondary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const Text('، وتقع في قارة', style: TextStyle(fontSize: 16)),
            SizedBox(
              width: 100,
              height: 35,
              child: TextField(
                controller: _blank2,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 8,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.secondary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const Text('.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
