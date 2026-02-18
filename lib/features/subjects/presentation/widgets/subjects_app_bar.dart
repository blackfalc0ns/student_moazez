import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/theme/app_colors.dart';

class SubjectsAppBar extends StatelessWidget {
  final bool isGridView;
  final Function(bool) onViewChanged;

  const SubjectsAppBar({
    super.key,
    required this.isGridView,
    required this.onViewChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Row(
              children: [
                // Back Button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textPrimary,
                      size: 20,
                    ),
                  ),
                ),
                const Spacer(),

                // Title
                const Text(
                  'المواد الدراسية',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const Spacer(),

                // Placeholder for symmetry
                const SizedBox(width: 48),
              ],
            ),
            const SizedBox(height: 16),

            // Filter and View Toggle
            Row(
              children: [
                // Filter Button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primary, width: 1),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'التصنيف',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                // View Toggle Buttons
                Row(
                  children: [
                    _buildViewButton(
                      icon: FontAwesomeIcons.list,
                      isActive: !isGridView,
                      onTap: () => onViewChanged(false),
                    ),
                    const SizedBox(width: 8),
                    _buildViewButton(
                      icon: FontAwesomeIcons.grip,
                      isActive: isGridView,
                      onTap: () => onViewChanged(true),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: FaIcon(
          icon,
          size: 18,
          color: isActive ? AppColors.white : AppColors.textSecondary,
        ),
      ),
    );
  }
}
