import 'package:flutter/material.dart';
import '../../data/models/subject_model.dart';
import 'subject_card.dart';

class SubjectsGridView extends StatelessWidget {
  final List<SubjectModel> subjects;

  const SubjectsGridView({
    super.key,
    required this.subjects,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder<double>(
          duration: Duration(milliseconds: 300 + (index * 50)),
          tween: Tween(begin: 0.0, end: 1.0),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            // Clamp value to ensure it's between 0.0 and 1.0
            final clampedValue = value.clamp(0.0, 1.0);
            return Transform.scale(
              scale: clampedValue,
              child: Opacity(
                opacity: clampedValue,
                child: child,
              ),
            );
          },
          child: SubjectCard(
            subject: subjects[index],
            isGridView: true,
          ),
        );
      },
    );
  }
}
