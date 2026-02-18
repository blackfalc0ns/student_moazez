import 'package:flutter/material.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/hero_journey_card.dart';
import '../widgets/map_tracking_card.dart';

import '../widgets/quick_actions_widget.dart';
import '../widgets/tasks_section_widget.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Content
          Column(
            children: [
              const HomeAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    bottom: 100,
                  ), // Space for BottomNavBar
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const HeroJourneyCard(),
                      const SizedBox(height: 24),
                      const MapTrackingCard(),
                      const SizedBox(height: 24),
                      const QuickActionsWidget(),
                      const SizedBox(height: 24),
                      const TasksSectionWidget(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Floating Bottom Nav Bar
          SafeArea(
            child: CustomBottomNavBar(
              selectedIndex: 0,
              onTap: (index) {
                // Handle navigation
              },
            ),
          ),
        ],
      ),
    );
  }
}
