import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../subjects/data/models/subject_model.dart';

class SubjectDetailsHeader extends StatelessWidget {
  final SubjectModel subject;
  final TabController tabController;
  final bool innerBoxIsScrolled;

  const SubjectDetailsHeader({
    super.key,
    required this.subject,
    required this.tabController,
    required this.innerBoxIsScrolled,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320.0,
      floating: false,
      pinned: true,
      backgroundColor: subject.color,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {},
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: innerBoxIsScrolled
            ? Text(
                subject.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            : null,
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Gradient Background
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [subject.color, subject.color.withOpacity(0.8)],
                ),
              ),
            ),
            // Decorative Pattern
            Positioned(
              right: -30,
              bottom: -30,
              child: Icon(
                subject.icon ?? FontAwesomeIcons.book,
                size: 200,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            // Content Info
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      subject.icon ?? FontAwesomeIcons.book,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    subject.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          FontAwesomeIcons.graduationCap,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${subject.lessonsCount} درس • 5 ساعات',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Progress Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'المكتمل 45%',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: 0.45,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            valueColor: const AlwaysStoppedAnimation(
                              Colors.white,
                            ),
                            minHeight: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: TabBar(
              controller: tabController,
              labelColor: subject.color,
              unselectedLabelColor: Colors.grey,
              indicatorColor: subject.color,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Cairo',
              ),
              tabs: const [
                Tab(
                  icon: Icon(FontAwesomeIcons.circlePlay, size: 20),
                  text: "الدروس",
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.penToSquare, size: 20),
                  text: "الواجبات",
                ),
                Tab(
                  icon: Icon(FontAwesomeIcons.fileLines, size: 20),
                  text: "المرفقات",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
