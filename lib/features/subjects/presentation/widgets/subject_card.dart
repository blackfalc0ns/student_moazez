import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/subject_model.dart';

class SubjectCard extends StatefulWidget {
  final SubjectModel subject;
  final bool isGridView;

  const SubjectCard({
    super.key,
    required this.subject,
    required this.isGridView,
  });

  @override
  State<SubjectCard> createState() => _SubjectCardState();
}

class _SubjectCardState extends State<SubjectCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    if (widget.isGridView) {
      return _buildGridCard();
    } else {
      return _buildListCard();
    }
  }

  Widget _buildGridCard() {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        // Handle card tap
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.95 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          decoration: BoxDecoration(
            color: widget.subject.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.subject.color.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Three dots menu
              Positioned(top: 8, left: 8, child: _buildMenuButton()),

              // Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Folder Icon
                    SvgPicture.asset(
                      'assets/icons/Folder.svg',
                      width: 60,
                      height: 60,
                      colorFilter: ColorFilter.mode(
                        widget.subject.color,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Subject Name
                    Text(
                      widget.subject.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.subject.color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),

                    // Lessons Count
                    Text(
                      '${widget.subject.lessonsCount} ديسمبر',
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.subject.color.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListCard() {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        // Handle card tap
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.98 : 1.0,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.subject.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.subject.color.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Content
              Expanded(
                child: Row(
                  children: [
                    // Folder Icon
                    SvgPicture.asset(
                      'assets/icons/Folder.svg',
                      width: 50,
                      height: 50,
                      colorFilter: ColorFilter.mode(
                        widget.subject.color,
                        BlendMode.srcIn,
                      ),
                    ),
                    // Subject Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.subject.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: widget.subject.color,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${widget.subject.lessonsCount} ديسمبر',
                            style: TextStyle(
                              fontSize: 12,
                              color: widget.subject.color.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Three dots menu
                    _buildMenuButton(),
                    const SizedBox(width: 12),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton() {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Icon(
        Icons.more_vert,
        color: widget.subject.color.withOpacity(0.5),
        size: 25,
      ),
    );
  }
}
