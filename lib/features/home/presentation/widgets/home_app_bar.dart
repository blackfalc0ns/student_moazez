import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/theme/app_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Profile Avatar (Right in RTL)
            _buildProfileAvatar(),
            const SizedBox(width: 12),
            // Progress Section (Middle)
            // Progress Section (Middle)
            _buildProgressSection(),
            const SizedBox(width: 12),
            // Notification Icon (Left in LTR, first in code for RTL display on right)
            _buildIconButton(
              icon: Icons.search,
              onTap: () {
                // Handle search tap
              },
            ),
            _buildNotificationIcon(),
            const SizedBox(width: 8),

            // Search Icon
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildIconButton(
          icon: Icons.notifications_rounded,
          onTap: () {
            // Handle notification tap
          },
        ),
        Positioned(
          top: 6,
          right: 6,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: SvgPicture.asset(
          'assets/icons/search-normal.svg',
          colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          width: 22,
          height: 22,
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return SizedBox(
      width: 58,
      height: 58,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Gradient Border
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
            padding: const EdgeInsets.all(2), // Border width
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Icon(
                  Icons.person,
                  color: AppColors.primary.withOpacity(0.6),
                  size: 28,
                ),
              ),
            ),
          ),
          // Level Badge
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: const Text(
                'Lv. 5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Top Row with labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'المستوى القادم',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textLight70,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Cairo',
                ),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontFamily: 'Cairo', fontSize: 12),
                  children: [
                    TextSpan(
                      text: '3000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' / 1500 XP',
                      style: TextStyle(
                        color: AppColors.textLight70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Gradient Progress Bar
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              widthFactor: 0.65,
              alignment: Alignment.centerRight, // RTL fill
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
