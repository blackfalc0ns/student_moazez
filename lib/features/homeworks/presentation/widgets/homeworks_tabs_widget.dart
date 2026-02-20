import 'package:flutter/material.dart';
import '../../../../core/utils/theme/app_colors.dart';

class HomeworksTabsWidget extends StatelessWidget {
  final TabController tabController;
  final int totalCount;
  final int newCount;
  final int completedCount;
  final int notCompletedCount;

  const HomeworksTabsWidget({
    super.key,
    required this.tabController,
    required this.totalCount,
    required this.newCount,
    required this.completedCount,
    required this.notCompletedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 50,
      child: TabBar(
        controller: tabController,
        isScrollable: false,
        padding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.primary,
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[600],
        dividerColor: Colors.transparent,
        tabs: [
          _buildTab('كل الواجبات', totalCount, 0),
          _buildTab('جديد', newCount, 1),
          _buildTab('مكتمل', completedCount, 2),
          _buildTab('غير مكتمل', notCompletedCount, 3),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int count, int index) {
    final isSelected = tabController.index == index;
    return Tab(
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                  fontSize: 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.orangeAccent : Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[600],
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
