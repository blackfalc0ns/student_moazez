import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/theme/app_colors.dart';
import 'base_question_container.dart';

class FileUploadQuestionWidget extends StatefulWidget {
  final int index;
  const FileUploadQuestionWidget({super.key, required this.index});

  @override
  State<FileUploadQuestionWidget> createState() =>
      _FileUploadQuestionWidgetState();
}

class _FileUploadQuestionWidgetState extends State<FileUploadQuestionWidget> {
  bool isUploaded = false;

  @override
  Widget build(BuildContext context) {
    return BaseQuestionContainer(
      questionType: 'رفع ملف',
      points: 15,
      questionText: '${widget.index}. قم برفع ملف البحث الخاص بك بصيغة PDF.',
      child: GestureDetector(
        onTap: () {
          setState(() {
            isUploaded = !isUploaded;
          });
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: isUploaded
                ? Colors.green.withOpacity(0.05)
                : AppColors.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isUploaded
                  ? Colors.green.withOpacity(0.3)
                  : AppColors.primary.withOpacity(0.3),
              style: BorderStyle.solid,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                isUploaded ? Icons.check_circle : FontAwesomeIcons.cloudArrowUp,
                color: isUploaded ? Colors.green : AppColors.primary,
                size: 40,
              ),
              const SizedBox(height: 12),
              Text(
                isUploaded
                    ? 'تم رفع الملف بنجاح (بحث_العلوم.pdf)'
                    : 'اضغط هنا لرفع الملف',
                style: TextStyle(
                  color: isUploaded ? Colors.green[700] : AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              if (!isUploaded) ...[
                const SizedBox(height: 4),
                Text(
                  'الحد الأقصى للملف 10 ميجابايت (PDF, DOCX)',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
