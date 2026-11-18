import 'package:flutter/material.dart';
import '../../../../../core/common_widgets/custom_button_widget.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../data/models/project_model.dart';
import '../../../roadmap_data_controller.dart';

class ProjectDetailsDialogWidget extends StatefulWidget {
  final ProjectModel project;
  final bool isArabic;
  final RoadmapDataController roadmapDataController;

  ProjectDetailsDialogWidget({
    super.key,
    required this.project,
    required this.isArabic,
    required this.roadmapDataController,
  });

  @override
  State<ProjectDetailsDialogWidget> createState() => ProjectDetailsDialogWidgetState();
}

class ProjectDetailsDialogWidgetState extends State<ProjectDetailsDialogWidget> {
  late TextEditingController repoController;
  late TextEditingController notesController;
  late String currentStatus;

  @override
  void initState() {
    super.initState();
    repoController = TextEditingController(text: widget.project.repoUrl);
    notesController = TextEditingController(text: widget.project.notes);
    currentStatus = widget.project.status;
  }

  @override
  void dispose() {
    repoController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppLocalizations loc = AppLocalizations.of(context)!;
    String name = widget.isArabic ? widget.project.nameAr : widget.project.nameEn;
    String desc = widget.isArabic ? widget.project.descriptionAr : widget.project.descriptionEn;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
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
            SizedBox(height: 16),
            Text(
              loc.translate('statusLabel'),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            DropdownButtonFormField<String>(
              initialValue: currentStatus,
              decoration: InputDecoration(isDense: true),
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
                  setState(() {
                    currentStatus = val;
                  });
                }
              },
            ),
            SizedBox(height: 14),
            Text(
              loc.translate('githubRepoUrl'),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            TextField(
              controller: repoController,
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'https://github.com/...',
                prefixIcon: Icon(Icons.link, size: 18),
                isDense: true,
              ),
            ),
            SizedBox(height: 14),
            Text(
              loc.translate('personalNotes'),
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            TextField(
              controller: notesController,
              maxLines: 3,
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: loc.translate('personalNotesHint'),
              ),
            ),
            SizedBox(height: 20),
            CustomButtonWidget(
              text: loc.translate('save'),
              onPressed: () async {
                await widget.roadmapDataController.updateProjectStatus(
                  widget.project.id,
                  currentStatus,
                );
                await widget.roadmapDataController.updateProjectRepoUrl(
                  widget.project.id,
                  repoController.text.trim(),
                );
                await widget.roadmapDataController.updateProjectNotes(
                  widget.project.id,
                  notesController.text.trim(),
                );
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
