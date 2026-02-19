import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/theme/app_colors.dart';
import '../../../subjects/data/models/subject_model.dart';
import 'package:flutter/widgets.dart';

class SubjectAttachmentsTab extends StatelessWidget {
  final SubjectModel subject;

  const SubjectAttachmentsTab({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                FontAwesomeIcons.filePdf,
                color: Colors.red,
                size: 24,
              ),
            ),
            title: Text(
              'ملخص الوحدة ${index + 1}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                'PDF • 2.5 MB',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
            ),
            trailing: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: subject.backgroundColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.download_rounded,
                color: subject.color,
                size: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}
