import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:student_app/core/utils/constant/font_manger.dart';
import 'package:student_app/core/utils/constant/styles_manger.dart';
import '../../../../core/utils/theme/app_colors.dart';

class MapTrackingCard extends StatefulWidget {
  const MapTrackingCard({super.key});

  @override
  State<MapTrackingCard> createState() => _MapTrackingCardState();
}

class _MapTrackingCardState extends State<MapTrackingCard> {
  // Use a simple controller with a default position (e.g., Riyadh)
  final MapController controller = MapController(
    initPosition: GeoPoint(latitude: 24.7136, longitude: 46.6753),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Map Background
            OSMFlutter(
              controller: controller,
              osmOption: OSMOption(
                userTrackingOption: const UserTrackingOption(
                  enableTracking: false,
                  unFollowUser: true,
                ),
                zoomOption: const ZoomOption(
                  initZoom: 14,
                  minZoomLevel: 2,
                  maxZoomLevel: 19,
                  stepZoom: 1.0,
                ),
                isPicker: false,
              ),
            ),

            // Top Left Stars Button
            Positioned(
              top: 0,
              left: 4,
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.secondary.withValues(alpha: 0.8),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.white, width: 2),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/stars_in_map.png',
                  color: Colors.white,
                ),
              ),
            ),

            // Map Control Buttons (Right Side)
            Positioned(
              top: 16,
              right: 12,
              child: Column(
                children: [
                  // My Location Button
                  _buildMapControlButton(
                    icon: Icons.my_location,
                    onTap: () async {
                      await controller.currentLocation();
                    },
                  ),
                  const SizedBox(height: 8),
                  // Zoom In Button
                  _buildMapControlButton(
                    icon: Icons.add,
                    onTap: () async {
                      await controller.zoomIn();
                    },
                  ),
                  const SizedBox(height: 8),
                  // Zoom Out Button
                  _buildMapControlButton(
                    icon: Icons.remove,
                    onTap: () async {
                      await controller.zoomOut();
                    },
                  ),
                ],
              ),
            ),

            // Center Status Notification
            Positioned(
              top:
                  50, // Adjust position to be somewhat central but above the track
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Car Icon Circle with Ripple effect (simulation using shadows/border)
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 0,
                          spreadRadius: 6,
                        ),
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.2),
                          blurRadius: 0,
                          spreadRadius: 12,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/car_icon.png',
                      color: Colors.white,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Text Pill
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.primary, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      "ولي الأمر في الطريق : 5 د",
                      style: getBoldStyle(
                        fontFamily: FontConstant.cairo,
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Tracking Path Section
            Positioned(
              bottom: 0,
              left: 12,
              right: 12,
              child: Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // School Icon
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'assets/images/school.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Progress Track
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              // Full Dotted LineBackground
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(8, (index) {
                                  return Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE0E0E0), // Light grey
                                      shape: BoxShape.circle,
                                    ),
                                  );
                                }),
                              ),
                              // Active Progress (Solid Line)
                              Container(
                                width:
                                    constraints.maxWidth * 0.6, // 60% progress
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              // Current Position Dot
                              Positioned(
                                left: constraints.maxWidth * 0.6 - 8,
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Character Avatar
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.white,
                        backgroundImage: const AssetImage(
                          'assets/images/charcter_map.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapControlButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
      ),
    );
  }
}
