import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/theme/app_colors.dart';
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
      color: AppColors.primary,
      backgroundColor: AppColors.primary.withOpacity(0.1),
      icon: FontAwesomeIcons.calculator,
    ),
    SubjectModel(
      id: '2',
      name: 'الفيزياء',
      lessonsCount: 14,
      color: AppColors.secondary,
      backgroundColor: AppColors.secondary.withOpacity(0.1),
      icon: FontAwesomeIcons.atom,
    ),
    SubjectModel(
      id: '3',
      name: 'اللغة العربية',
      lessonsCount: 22,
      color: AppColors.deepOrange,
      backgroundColor: AppColors.deepOrange.withOpacity(0.1),
      icon: FontAwesomeIcons.language,
    ),
    SubjectModel(
      id: '4',
      name: 'الكيمياء',
      lessonsCount: 14,
      color: AppColors.info,
      backgroundColor: AppColors.info.withOpacity(0.1),
      icon: FontAwesomeIcons.flask,
    ),
    SubjectModel(
      id: '5',
      name: 'الفقه',
      lessonsCount: 25,
      color: AppColors.softGreen,
      backgroundColor: AppColors.softGreen.withOpacity(0.1),
      icon: FontAwesomeIcons.scaleBalanced,
    ),
    SubjectModel(
      id: '6',
      name: 'التوحيد',
      lessonsCount: 15,
      color: AppColors.primaryDeep,
      backgroundColor: AppColors.primaryDeep.withOpacity(0.1),
      icon: FontAwesomeIcons.mosque,
    ),
    SubjectModel(
      id: '7',
      name: 'القرآن',
      lessonsCount: 22,
      color: AppColors.green,
      backgroundColor: AppColors.green.withOpacity(0.1),
      icon: FontAwesomeIcons.bookQuran,
    ),
    SubjectModel(
      id: '8',
      name: 'التفسير',
      lessonsCount: 14,
      color: AppColors.warning,
      backgroundColor: AppColors.warning.withOpacity(0.1),
      icon: FontAwesomeIcons.bookOpen,
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
