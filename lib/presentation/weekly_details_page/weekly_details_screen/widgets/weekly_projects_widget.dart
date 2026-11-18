import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/status_badge_widget.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/week_model.dart';
import '../../../../../data/models/project_model.dart';
import '../../../roadmap_data_controller.dart';
import '../../weekly_details_controller/weekly_details_controller.dart';

class WeeklyProjectsWidget extends StatelessWidget {
  final WeekModel week;
  final bool isArabic;
  final RoadmapDataController roadmapDataController;
  final WeeklyDetailsController controller;

  WeeklyProjectsWidget({
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
          loc.translate('weeklyProjects'),
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
          itemCount: week.projects.length,
          itemBuilder: (context, index) {
            ProjectModel proj = week.projects[index];
            String name = isArabic ? proj.nameAr : proj.nameEn;
            String desc = isArabic ? proj.descriptionAr : proj.descriptionEn;
            TextEditingController repoCtrl = controller.getRepoController(proj.id, proj.repoUrl);

            return Container(
              margin: EdgeInsets.only(bottom: 14),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(14),
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
                          name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      StatusBadgeWidget(status: proj.status),
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    desc,
                    style: TextStyle(
                      fontSize: 13,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        loc.translate('statusLabel'),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 8),
                      DropdownButton<String>(
                        value: proj.status,
                        isDense: true,
                        items: ['Not Started', 'In Progress', 'Completed']
                            .map((s) => DropdownMenuItem(
                                  value: s,
                                  child: Text(
                                    loc.translateStatus(s),
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ))
                            .toList(),
                        onChanged: (val) {
                          if (val != null) {
                            roadmapDataController.updateProjectStatus(proj.id, val);
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  if (proj.checklistEn.isNotEmpty) ...[
                    Text(
                      loc.translate('weeklyChecklist'),
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6),
                    Column(
                      children: List.generate(proj.checklistEn.length, (chkIdx) {
                        String chkText = isArabic
                            ? proj.checklistAr[chkIdx]
                            : proj.checklistEn[chkIdx];
                        bool isChecked = chkIdx < proj.checklistStatus.length
                            ? proj.checklistStatus[chkIdx]
                            : false;

                        return CheckboxListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            chkText,
                            style: TextStyle(fontSize: 12),
                          ),
                          value: isChecked,
                          onChanged: (val) {
                            if (val != null) {
                              roadmapDataController.toggleProjectChecklist(
                                proj.id,
                                chkIdx,
                                val,
                              );
                            }
                          },
                        );
                      }),
                    ),
                    SizedBox(height: 8),
                  ],
                  TextField(
                    controller: repoCtrl,
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: loc.translate('githubRepoUrl'),
                      prefixIcon: Icon(Icons.link, size: 18),
                      isDense: true,
                    ),
                  ),
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 120,
                      height: 36,
                      child: CustomButtonWidget(
                        text: loc.translate('save'),
                        onPressed: () {
                          roadmapDataController.updateProjectRepoUrl(
                            proj.id,
                            repoCtrl.text.trim(),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(loc.translate('projectSaved'))),
                          );
                        },
                      ),
                    ),
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
