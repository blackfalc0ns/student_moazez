import 'package:flutter/material.dart';
import 'package:student_app/core/utils/constant/font_manger.dart';
import 'package:student_app/core/utils/constant/styles_manger.dart';
import '../../../../core/utils/theme/app_colors.dart';

class HeroJourneyCard extends StatelessWidget {
  const HeroJourneyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Hero Journey Image
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/images/hero_journey.png',
              fit: BoxFit.fill,
              width: double.infinity,
              height: 200,
            ),
          ),

          // Words Overlay
          Positioned(
            top: 15,
            left: 25,
            right: 0,
            child: Image.asset(
              'assets/images/hero_journey_words.png',
              fit: BoxFit.contain,
              alignment: Alignment.topLeft,
              height: 75,
            ),
          ),

          // Start Button at Bottom Center
          Positioned(
            bottom: -16,
            left: 0,
            right: 0,
            child: Center(child: _buildStartButton()),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFB800), AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withValues(alpha: 0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 50,
            child: Image.asset('assets/images/star.png', width: 20),
          ),

          Positioned(
            top: 2,
            left: 4,
            child: Image.asset('assets/images/star.png', width: 30),
          ),
          Positioned(
            top: 8,
            right: 5,
            child: Image.asset('assets/images/star.png', width: 30),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Handle start button tap
              },
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: AppColors.secondary,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'أبدأ',
                      style: getBoldStyle(
                        fontFamily: FontConstant.cairo,
                        fontSize: 20,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
