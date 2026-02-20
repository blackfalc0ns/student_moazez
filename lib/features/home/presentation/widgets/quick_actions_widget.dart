import 'package:flutter/material.dart';

import '../../../../core/utils/theme/app_colors.dart';
import '../../../../core/utils/constant/font_manger.dart';
import '../../../../core/utils/constant/styles_manger.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionItem(
            imagePath: 'assets/images/subjects-icon.png',
            label: "المواد",
            context: context,
            onTap: () {
              Navigator.pushNamed(context, '/subjects');
            },
          ),
          _buildActionItem(
            imagePath: 'assets/images/homework-icon.png',
            label: "الواجبات",
            context: context,
            onTap: () {
              Navigator.pushNamed(context, '/homeworks');
            },
          ),
          _buildActionItem(
            imagePath: 'assets/images/behavior-icon.png',
            label: "السلوك",
            context: context,
            onTap: () {
              Navigator.pushNamed(context, '/behavior');
            },
          ),
          _buildActionItem(
            imagePath: 'assets/images/grades-icon.png',
            label: "الدرجات",
            context: context,
            onTap: () {
              Navigator.pushNamed(context, '/grades');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String imagePath,
    required String label,
    required BuildContext context,
    VoidCallback? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 75,
            height: 75,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Image.asset(
              imagePath,
              color: Colors.white,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: getBoldStyle(
            fontFamily: FontConstant.cairo,
            fontSize: 14,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
