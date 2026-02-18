import 'package:flutter/material.dart';
import '../../data/models/subject_model.dart';
import 'subject_card.dart';

class SubjectsListView extends StatelessWidget {
  final List<SubjectModel> subjects;

  const SubjectsListView({
    super.key,
    required this.subjects,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 300 + (index * 50)),
          tween: Tween(begin: 0.0, end: 1.0),
          curve: Curves.easeOutCubic,
          builder: (context, value, child) {
            // Clamp value to ensure it's between 0.0 and 1.0
            final clampedValue = value.clamp(0.0, 1.0);
            return Transform.translate(
              offset: Offset(50 * (1 - clampedValue), 0),
              child: Opacity(
                opacity: clampedValue,
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: SubjectCard(
              subject: subjects[index],
              isGridView: false,
            ),
          ),
        );
      },
    );
  }
}
