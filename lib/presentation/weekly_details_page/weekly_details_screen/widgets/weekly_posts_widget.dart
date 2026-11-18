import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/status_badge_widget.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/week_model.dart';
import '../../../../../data/models/post_model.dart';
import '../../../roadmap_data_controller.dart';
import '../../weekly_details_controller/weekly_details_controller.dart';

class WeeklyPostsWidget extends StatelessWidget {
  final WeekModel week;
  final bool isArabic;
  final RoadmapDataController roadmapDataController;
  final WeeklyDetailsController controller;

  WeeklyPostsWidget({
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.translate('linkedInPosts'),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: week.posts.length,
          itemBuilder: (context, index) {
            PostModel post = week.posts[index];
            String title = isArabic ? post.titleAr : post.titleEn;
            TextEditingController urlCtrl = controller.getPostUrlController(post.id, post.postUrl);

            return Container(
              margin: EdgeInsets.only(bottom: 12),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      StatusBadgeWidget(status: post.status),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        loc.translate('statusLabel'),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      DropdownButton<String>(
                        value: post.status,
                        isDense: true,
                        items: ['Not Started', 'In Preparation', 'Ready', 'Published']
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(
                                    loc.translateStatus(s),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            roadmapDataController.updatePostStatus(post.id, val);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: urlCtrl,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            hintText: loc.translate('postUrl'),
                            prefixIcon: Icon(Icons.link, size: 16),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 90,
                        height: 38,
                        child: CustomButtonWidget(
                          text: loc.translate('save'),
                          onPressed: () {
                            roadmapDataController.updatePostUrl(
                              post.id,
                              urlCtrl.text.trim(),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(loc.translate('postSaved'))),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
