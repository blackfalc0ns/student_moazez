import 'package:flutter/material.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import 'base_question_container.dart';

class OrderingQuestionWidget extends StatefulWidget {
  final int index;
  const OrderingQuestionWidget({super.key, required this.index});

  @override
  State<OrderingQuestionWidget> createState() => _OrderingQuestionWidgetState();
}

class _OrderingQuestionWidgetState extends State<OrderingQuestionWidget> {
  final List<String> _items = [
    'المرحلة الإعدادية',
    'المرحلة الثانوية',
    'الروضة (رياض الأطفال)',
    'المرحلة الابتدائية',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseQuestionContainer(
      questionType: 'ترتيب متسلسل',
      points: 4,
      questionText:
          '${widget.index}. رتب المراحل التعليمية من الأصغر إلى الأكبر:',
      child: ReorderableListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (int i = 0; i < _items.length; i++)
            Container(
              key: ValueKey(_items[i]),
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 12,
                  child: Text(
                    '${i + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                title: Text(
                  _items[i],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                trailing: Icon(Icons.drag_indicator, color: Colors.grey[400]),
              ),
            ),
        ],
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final String item = _items.removeAt(oldIndex);
            _items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
