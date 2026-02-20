import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:student_app/core/utils/common/custom_app_bar.dart';
import '../../../../core/utils/animations/scroll_animation_widget.dart';
import '../../data/models/homework_model.dart';
import '../widgets/homework_card_widget.dart';
import '../widgets/homeworks_tabs_widget.dart';

class HomeworksScreen extends StatefulWidget {
  const HomeworksScreen({super.key});

  @override
  State<HomeworksScreen> createState() => _HomeworksScreenState();
}

class _HomeworksScreenState extends State<HomeworksScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<HomeworkModel> _dummyHomeworks = [
    HomeworkModel(
      id: '1',
      subjectName: 'الرياضيات',
      homeworkName: 'الواجب الأول',
      grade: '100',
      status: HomeworkStatus.completed,
      color: Colors.blueAccent,
      icon: FontAwesomeIcons.calculator,
      studentsCount: 23,
      studentAvatars: [],
    ),
    HomeworkModel(
      id: '2',
      subjectName: 'اللغة العربية',
      homeworkName: 'الواجب الثاني',
      grade: '100',
      status: HomeworkStatus.waiting,
      color: Colors.orangeAccent,
      icon: FontAwesomeIcons.bookOpen,
      studentsCount: 10,
      studentAvatars: [],
    ),
    HomeworkModel(
      id: '3',
      subjectName: 'الكيمياء',
      homeworkName: 'الواجب الثالث',
      grade: '50',
      status: HomeworkStatus.notCompleted,
      color: Colors.purpleAccent,
      icon: FontAwesomeIcons.flask,
      studentsCount: 5,
      studentAvatars: [],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<HomeworkModel> get _filteredHomeworks {
    switch (_tabController.index) {
      case 0:
        return _dummyHomeworks;
      case 1:
        return _dummyHomeworks
            .where((h) => h.status == HomeworkStatus.waiting)
            .toList();
      case 2:
        return _dummyHomeworks
            .where((h) => h.status == HomeworkStatus.completed)
            .toList();
      case 3:
        return _dummyHomeworks
            .where((h) => h.status == HomeworkStatus.notCompleted)
            .toList();
      default:
        return _dummyHomeworks;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الواجبات المدرسية'),
      body: Column(
        children: [
          ScrollAnimationWidget(
            animationType: AnimationType.fadeSlideDown,
            duration: const Duration(milliseconds: 400),
            child: AnimatedBuilder(
              animation: _tabController,
              builder: (context, _) {
                return HomeworksTabsWidget(
                  tabController: _tabController,
                  totalCount: _dummyHomeworks.length,
                  newCount: _dummyHomeworks
                      .where((h) => h.status == HomeworkStatus.waiting)
                      .length,
                  completedCount: _dummyHomeworks
                      .where((h) => h.status == HomeworkStatus.completed)
                      .length,
                  notCompletedCount: _dummyHomeworks
                      .where((h) => h.status == HomeworkStatus.notCompleted)
                      .length,
                );
              },
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _tabController,
              builder: (context, child) {
                final items = _filteredHomeworks;
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ScrollAnimationWidget(
                      animationType: AnimationType.fadeSlideUp,
                      delay: 100 * index,
                      child: HomeworkCardWidget(homework: items[index]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
