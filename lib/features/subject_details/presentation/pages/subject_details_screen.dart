import 'package:flutter/material.dart';
import '../../../subjects/data/models/subject_model.dart';
import '../widgets/subject_details_header.dart';
import '../widgets/subject_lessons_tab.dart';
import '../widgets/subject_assignments_tab.dart';
import '../widgets/subject_attachments_tab.dart';

class SubjectDetailsScreen extends StatefulWidget {
  final SubjectModel subject;

  const SubjectDetailsScreen({super.key, required this.subject});

  @override
  State<SubjectDetailsScreen> createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SubjectDetailsHeader(
              subject: widget.subject,
              tabController: _tabController,
              innerBoxIsScrolled: innerBoxIsScrolled,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            SubjectLessonsTab(subject: widget.subject),
            SubjectAssignmentsTab(subject: widget.subject),
            SubjectAttachmentsTab(subject: widget.subject),
          ],
        ),
      ),
    );
  }
}
