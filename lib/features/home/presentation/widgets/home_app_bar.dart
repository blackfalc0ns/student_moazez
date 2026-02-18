import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            _buildIconButton(
              imagePath: 'assets/icons/search-normal.svg',
              onTap: () {
                // Handle search tap
              },
            ),
            const SizedBox(width: 8),
            // Notification Icon (Left in LTR, first in code for RTL display on right)
            _buildNotificationIcon(),
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
          top: -2,
          right: -2,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: AppColors.red,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    IconData? icon,
    String? imagePath,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        padding: imagePath != null ? const EdgeInsets.all(10) : null,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha:  0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: imagePath != null
            ? SvgPicture.asset(
                imagePath,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              )
            : Icon(icon, color: AppColors.primary, size: 22),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Circular Progress Ring
          SizedBox(
            width: 50,
            height: 50,
            child: Transform.rotate(
              angle: -3.14 / 2, // Start from top
              child: CircularProgressIndicator(
                value: 0.7,
                strokeWidth: 4,
                backgroundColor: AppColors.lightGray.withValues(alpha: 0.5),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
          // Profile Image Container (Centered)
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: ClipOval(
              child: Icon(Icons.person, color: Colors.grey[400], size: 24),
            ),
          ),
          // Level Badge
          Positioned(
            bottom: -6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                'Lv. 5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
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
                      text: '1500 ',
                      style: TextStyle(
                        color: AppColors.textLight70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: '/',
                      style: TextStyle(
                        color: AppColors.textLight70,
                      ),
                    ),
                    TextSpan(
                      text: ' 3000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: ' XP',
                      style: TextStyle(
                        color: AppColors.textLight70,
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
