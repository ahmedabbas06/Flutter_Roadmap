import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/week_model.dart';
import '../../../roadmap_data_controller.dart';
import '../../weekly_details_controller/weekly_details_controller.dart';

class WeeklyReviewWidget extends StatelessWidget {
  final WeekModel week;
  final bool isArabic;
  final RoadmapDataController roadmapDataController;
  final WeeklyDetailsController controller;

  WeeklyReviewWidget({
    super.key,
    required this.week,
    required this.isArabic,
    required this.roadmapDataController,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;
    String prompt = isArabic ? week.reviewPromptAr : week.reviewPromptEn;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.translate('weeklyReview'),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 6),
        Text(
          prompt,
          style: TextStyle(
            fontSize: 13,
            color: theme.colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller.reviewTextController,
          maxLines: 4,
          style: TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: loc.translate('personalNotes'),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: 160,
            height: 42,
            child: CustomButtonWidget(
              text: loc.translate('saveNotes'),
              onPressed: () {
                roadmapDataController.updateWeeklyReview(
                  week.weekNumber,
                  controller.reviewTextController.text,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(loc.translate('notesSaved'))),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
