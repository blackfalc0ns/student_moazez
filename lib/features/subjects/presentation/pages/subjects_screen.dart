import 'package:flutter/material.dart';
import '../widgets/subjects_app_bar.dart';
import '../widgets/subjects_grid_view.dart';
import '../widgets/subjects_list_view.dart';
import '../../data/models/subject_model.dart';

class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({super.key});

  @override
  State<SubjectsScreen> createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  bool isGridView = true;

  final List<SubjectModel> subjects = [
    SubjectModel(
      id: '1',
      name: 'الرياضيات',
      lessonsCount: 20,
      color: const Color(0xFF4A6FA5),
      backgroundColor: const Color(0xFFE8EDF5),
    ),
    SubjectModel(
      id: '2',
      name: 'الفيزياء',
      lessonsCount: 14,
      color: const Color(0xFFD4A574),
      backgroundColor: const Color(0xFFFFF8E8),
    ),
    SubjectModel(
      id: '3',
      name: 'اللغة العربية',
      lessonsCount: 22,
      color: const Color(0xFFD85D5D),
      backgroundColor: const Color(0xFFFFF0F0),
    ),
    SubjectModel(
      id: '4',
      name: 'الكيمياء',
      lessonsCount: 14,
      color: const Color(0xFF2D9B9B),
      backgroundColor: const Color(0xFFE8F5F5),
    ),
    SubjectModel(
      id: '5',
      name: 'الفقه',
      lessonsCount: 25,
      color: const Color(0xFF4A6FA5),
      backgroundColor: const Color(0xFFE8EDF5),
    ),
    SubjectModel(
      id: '6',
      name: 'التوحيد',
      lessonsCount: 15,
      color: const Color(0xFFD4A574),
      backgroundColor: const Color(0xFFFFF8E8),
    ),
    SubjectModel(
      id: '7',
      name: 'القرآن',
      lessonsCount: 22,
      color: const Color(0xFFD85D5D),
      backgroundColor: const Color(0xFFFFF0F0),
    ),
    SubjectModel(
      id: '8',
      name: 'التفسير',
      lessonsCount: 14,
      color: const Color(0xFF2D9B9B),
      backgroundColor: const Color(0xFFE8F5F5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SubjectsAppBar(
            isGridView: isGridView,
            onViewChanged: (value) {
              setState(() {
                isGridView = value;
              });
            },
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: isGridView
                  ? SubjectsGridView(
                      key: const ValueKey('grid'),
                      subjects: subjects,
                    )
                  : SubjectsListView(
                      key: const ValueKey('list'),
                      subjects: subjects,
                    ),
            ),
          ),
          SizedBox(height: 35),
        ],
      ),
    );
  }
}
