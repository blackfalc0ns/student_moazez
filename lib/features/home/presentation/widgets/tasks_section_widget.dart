import 'package:flutter/material.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/constant/font_manger.dart';
import '../../../../core/utils/constant/styles_manger.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TasksSectionWidget extends StatelessWidget {
  const TasksSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter Tabs
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildFilterTab(label: "كل المهام", count: 2, isActive: true),
              const SizedBox(width: 8),
              _buildFilterTab(label: "لم تكتمل", count: 1, isActive: false),
              const SizedBox(width: 8),
              _buildFilterTab(label: "المكتملة", count: 1, isActive: false),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Tasks List
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 2,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _buildTaskCard(
              title: "اسم المهمة",
              date: "27 أبريل",
              category: "الفئة",
              priority: "عالي",
              isCompleted: index == 1,
            );
          },
        ),
      ],
    );
  }

  Widget _buildFilterTab({
    required String label,
    required int count,
    required bool isActive,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: getBoldStyle(
              fontFamily: FontConstant.cairo,
              fontSize: 14,
              color: isActive ? Colors.white : Colors.grey[600],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isActive ? AppColors.secondary : Colors.grey[400],
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
            child: Center(
              child: Text(
                count.toString(),
                style: getBoldStyle(
                  fontFamily: FontConstant.cairo,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard({
    required String title,
    required String date,
    required String category,
    required String priority,
    required bool isCompleted,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Square Image Placeholder (Teal box)
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFA5D6A7,
                  ).withValues(alpha: 0.5), // Pale Teal
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 8),
              // Details Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Row
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Color(0xFF006D82), // Teal color from image
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            FontAwesomeIcons.boltLightning,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: getBoldStyle(
                            fontFamily: FontConstant.cairo,
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Tags Row
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.end,
                      children: [
                        _buildTag(
                          label: priority,
                          icon: FontAwesomeIcons.flag,
                          color: const Color(0xFFFFA000), // Orange
                          textColor: Colors.white,
                        ),
                        _buildTag(
                          label: category,
                          icon: FontAwesomeIcons.layerGroup,
                          color: const Color(0xFFEEF2F6), // Light grey
                          textColor: const Color(0xFF64748B),
                        ),
                        _buildTag(
                          label: isCompleted ? "مكتمل" : "لم يكتمل",
                          icon: isCompleted
                              ? FontAwesomeIcons.circleCheck
                              : FontAwesomeIcons.circle,
                          color: const Color(0xFFEEF2F6),
                          textColor: const Color(0xFF64748B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Progress Section with Percentage
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Percentage Text
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'التقدم',
                    style: getMediumStyle(
                      fontFamily: FontConstant.cairo,
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${(isCompleted ? 100 : 60)}%',
                      style: getBoldStyle(
                        fontFamily: FontConstant.cairo,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Progress Bar with Gradient
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerRight,
                    widthFactor: isCompleted ? 1.0 : 0.6,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Bottom Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Date Pill
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FA),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.calendar,
                      size: 14,
                      color: Color(0xFF64748B),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      date,
                      style: getMediumStyle(
                        fontFamily: FontConstant.cairo,
                        fontSize: 14,
                        color: const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              // Avatars Stack
              SizedBox(
                height: 30,
                width: 120,
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: List.generate(5, (index) {
                    return Positioned(
                      right: index * 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.grey[300],
                          child: const Icon(
                            Icons.person,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag({
    required IconData icon,
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: getMediumStyle(
              fontFamily: FontConstant.cairo,
              fontSize: 12,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
