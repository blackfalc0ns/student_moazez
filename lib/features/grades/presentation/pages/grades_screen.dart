import 'package:flutter/material.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/common/custom_app_bar.dart';
import '../../../../core/utils/animations/scroll_animation_widget.dart';
import '../../data/models/grade_model.dart';
import '../widgets/grade_summary_widget.dart';
import '../widgets/grade_subject_card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  int _selectedTermIndex = 0; // 0: First term, 1: Second term, 2: Full Year
  String _selectedAcademicYear = 'الصف الخامس (الحالي)';

  final List<String> _terms = ['الفصل الأول', 'الفصل الثاني', 'العام الدراسي'];
  final List<String> _academicYears = [
    'الصف الخامس (الحالي)',
    'الصف الرابع',
    'الصف الثالث',
    'الصف الثاني',
    'الصف الأول',
  ];

  // Dummy Data for Subjects
  final List<SubjectGradeModel> _dummySubjects = [
    SubjectGradeModel(
      id: '1',
      subjectName: 'اللغة العربية',
      icon: FontAwesomeIcons.bookOpen,
      color: Colors.blueAccent,
      totalMarks: 100,
      earnedMarks: 95,
      breakdown: [
        GradeBreakdown(title: 'أعمال السنة (شهر 1)', earned: 9, total: 10),
        GradeBreakdown(title: 'أعمال السنة (شهر 2)', earned: 10, total: 10),
        GradeBreakdown(title: 'اختبار منتصف الفصل', earned: 38, total: 40),
        GradeBreakdown(title: 'الاختبار النهائي', earned: 38, total: 40),
      ],
    ),
    SubjectGradeModel(
      id: '2',
      subjectName: 'الرياضيات',
      icon: FontAwesomeIcons.calculator,
      color: Colors.purpleAccent,
      totalMarks: 100,
      earnedMarks: 75,
      breakdown: [
        GradeBreakdown(title: 'أعمال السنة (شهر 1)', earned: 7, total: 10),
        GradeBreakdown(title: 'أعمال السنة (شهر 2)', earned: 8, total: 10),
        GradeBreakdown(title: 'اختبار منتصف الفصل', earned: 25, total: 40),
        GradeBreakdown(title: 'الاختبار النهائي', earned: 35, total: 40),
      ],
    ),
    SubjectGradeModel(
      id: '3',
      subjectName: 'العلوم',
      icon: FontAwesomeIcons.flask,
      color: Colors.teal,
      totalMarks: 100,
      earnedMarks: 89,
      breakdown: [
        GradeBreakdown(title: 'أعمال السنة (شهر 1)', earned: 9.5, total: 10),
        GradeBreakdown(title: 'أعمال السنة (شهر 2)', earned: 9, total: 10),
        GradeBreakdown(title: 'اختبار منتصف الفصل', earned: 36, total: 40),
        GradeBreakdown(title: 'الاختبار النهائي', earned: 34.5, total: 40),
      ],
    ),
    SubjectGradeModel(
      id: '4',
      subjectName: 'اللغة الإنجليزية',
      icon: FontAwesomeIcons.earthAmericas,
      color: Colors.orange,
      totalMarks: 100,
      earnedMarks: 60,
      breakdown: [
        GradeBreakdown(title: 'أعمال السنة (شهر 1)', earned: 6, total: 10),
        GradeBreakdown(title: 'أعمال السنة (شهر 2)', earned: 5, total: 10),
        GradeBreakdown(title: 'اختبار منتصف الفصل', earned: 20, total: 40),
        GradeBreakdown(title: 'الاختبار النهائي', earned: 29, total: 40),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Generate filtered total values based on dummy data
    double finalEarned = 0;
    double finalTotal = 0;

    for (var sub in _dummySubjects) {
      if (_selectedTermIndex == 0) {
        // Just mocking values based on term logic
        finalEarned += sub.earnedMarks;
        finalTotal += sub.totalMarks;
      } else if (_selectedTermIndex == 1) {
        finalEarned += sub.earnedMarks * 0.9; // fake second term dropping
        finalTotal += sub.totalMarks;
      } else {
        finalEarned += sub.earnedMarks * 1.9; // fake full year cumulative
        finalTotal += sub.totalMarks * 2;
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(title: 'تقارير الدرجات'),
      body: CustomScrollView(
        slivers: [
          // Academic Year Selector
          SliverToBoxAdapter(
            child: ScrollAnimationWidget(
              animationType: AnimationType.fadeSlideDown,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 4.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[200]!),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: _selectedAcademicYear,
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: AppColors.primary,
                      ),
                      items: _academicYears.map((String year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Row(
                            children: [
                              const Icon(
                                FontAwesomeIcons.graduationCap,
                                size: 16,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                year,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedAcademicYear = newValue;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Filter Chips (Term Selector)
          SliverToBoxAdapter(
            child: ScrollAnimationWidget(
              animationType: AnimationType.fadeSlideDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(_terms.length, (index) {
                      bool isSelected = _selectedTermIndex == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTermIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primary
                                    : Colors.grey[300]!,
                              ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: AppColors.primary.withOpacity(
                                          0.3,
                                        ),
                                        spreadRadius: 2,
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Center(
                              child: Text(
                                _terms[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),

          // Grade Summary with Percentage & Message
          SliverToBoxAdapter(
            child: ScrollAnimationWidget(
              animationType: AnimationType.fadeScale,
              delay: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: GradeSummaryWidget(
                  totalEarned: finalEarned,
                  totalMax: finalTotal,
                ),
              ),
            ),
          ),

          // Subject Breakdown Title
          SliverToBoxAdapter(
            child: ScrollAnimationWidget(
              animationType: AnimationType.fade,
              delay: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.clipboardCheck,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'درجات المواد',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Subjects List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return ScrollAnimationWidget(
                  animationType: AnimationType.fadeSlideUp,
                  delay: 200 + (index * 50),
                  child: GradeSubjectCardWidget(
                    subjectGrade: _dummySubjects[index],
                  ),
                );
              }, childCount: _dummySubjects.length),
            ),
          ),
        ],
      ),
    );
  }
}
