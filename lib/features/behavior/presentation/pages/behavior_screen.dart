import 'package:flutter/material.dart';
import '../../../../core/utils/common/custom_app_bar.dart';
import '../../../../core/utils/animations/scroll_animation_widget.dart';
import '../../data/models/behavior_model.dart';
import '../widgets/behavior_summary_widget.dart';
import '../widgets/behavior_record_card_widget.dart';
import '../widgets/behavior_tabs_widget.dart';

class BehaviorScreen extends StatefulWidget {
  const BehaviorScreen({super.key});

  @override
  State<BehaviorScreen> createState() => _BehaviorScreenState();
}

class _BehaviorScreenState extends State<BehaviorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<BehaviorRecord> _dummyRecords = [
    BehaviorRecord(
      id: '1',
      type: BehaviorType.attendance,
      title: 'حضور منتظم',
      date: 'اليوم, 16 نوفمبر',
      points: 0,
      note: 'تم تسجيل الحضور في الموعد.',
    ),
    BehaviorRecord(
      id: '2',
      type: BehaviorType.absence,
      title: 'غياب بدون عذر',
      date: 'الأحد, 13 نوفمبر',
      points: -50,
      note: 'تم الخصم بسبب الغياب دون إذن مسبق.',
    ),
    BehaviorRecord(
      id: '3',
      type: BehaviorType.lateness,
      title: 'تأخير عن الطابور',
      date: 'الخميس, 10 نوفمبر',
      points: -10,
    ),
    BehaviorRecord(
      id: '4',
      type: BehaviorType.positive,
      title: 'مشاركة متميزة بالصف',
      date: 'الثلاثاء, 8 نوفمبر',
      points: 20,
    ),
    BehaviorRecord(
      id: '5',
      type: BehaviorType.negative,
      title: 'إحداث فوضى بالممر',
      date: 'الإثنين, 7 نوفمبر',
      points: -30,
    ),
    BehaviorRecord(
      id: '6',
      type: BehaviorType.absence,
      title: 'غياب',
      date: 'أكتوبر, 27 أكتوبر',
      points: -50,
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

  List<BehaviorRecord> get _filteredRecords {
    switch (_tabController.index) {
      case 0:
        return _dummyRecords;
      case 1:
        return _dummyRecords
            .where((r) => r.type == BehaviorType.absence)
            .toList();
      case 2:
        return _dummyRecords
            .where((r) => r.type == BehaviorType.attendance)
            .toList();
      case 3:
        return _dummyRecords
            .where((r) => r.type == BehaviorType.lateness)
            .toList();
      default:
        return _dummyRecords;
    }
  }

  int _countType(BehaviorType type) {
    return _dummyRecords.where((r) => r.type == type).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: const CustomAppBar(title: 'السلوك'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ScrollAnimationWidget(
              animationType: AnimationType.fadeSlideDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: BehaviorSummaryWidget(
                  attendanceCount:
                      _countType(BehaviorType.attendance) +
                      11, // Dummy data to match UI
                  absenceCount: _countType(BehaviorType.absence) + 3,
                  latenessCount: _countType(BehaviorType.lateness) + 2,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ScrollAnimationWidget(
              child: AnimatedBuilder(
                animation: _tabController,
                builder: (context, _) {
                  return BehaviorTabsWidget(
                    tabController: _tabController,
                    totalCount: _dummyRecords.length,
                    attendanceCount: _countType(BehaviorType.attendance),
                    absenceCount: _countType(BehaviorType.absence),
                    latenessCount: _countType(BehaviorType.lateness),
                  );
                },
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _tabController,
            builder: (context, _) {
              final items = _filteredRecords;
              return SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ScrollAnimationWidget(
                      animationType: AnimationType.fadeSlideUp,
                      delay: 100 + (index * 50),
                      child: BehaviorRecordCardWidget(record: items[index]),
                    );
                  }, childCount: items.length),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
