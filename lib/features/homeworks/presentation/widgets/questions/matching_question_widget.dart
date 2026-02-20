import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import 'base_question_container.dart';

class MatchingQuestionWidget extends StatefulWidget {
  final int index;
  const MatchingQuestionWidget({super.key, required this.index});

  @override
  State<MatchingQuestionWidget> createState() => _MatchingQuestionWidgetState();
}

class _MatchingQuestionWidgetState extends State<MatchingQuestionWidget> {
  final List<String> groupA = ['الماء', 'الأكسجين', 'الحديد'];
  final List<String> groupB = ['O2', 'H2O', 'Fe'];

  // Dummy mapping for selected matching
  final Map<int, int?> _matches = {0: null, 1: null, 2: null};

  @override
  Widget build(BuildContext context) {
    return BaseQuestionContainer(
      questionType: 'سؤال توصيل (مطابقة)',
      points: 6,
      questionText: '${widget.index}. صل كل عنصر كيميائي برمزه الصحيح:',
      child: Column(
        children: List.generate(groupA.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.3),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      groupA[index],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: DropdownButton<int>(
                        value: _matches[index],
                        hint: const Text(
                          'اختر',
                          style: TextStyle(fontSize: 14),
                        ),
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: List.generate(groupB.length, (bIndex) {
                          return DropdownMenuItem(
                            value: bIndex,
                            child: Text(
                              groupB[bIndex],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                        onChanged: (val) {
                          setState(() {
                            _matches[index] = val;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
