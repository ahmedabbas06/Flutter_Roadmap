import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../projects_controller/projects_controller.dart';
import '../../roadmap_data_controller.dart';
import '../../../../core/localization/language_controller.dart';
import '../../../../core/common_widgets/loading_indicator_widget.dart';
import '../../../../core/common_widgets/empty_state_widget.dart';
import '../../../../core/localization/app_localizations.dart';
import 'widgets/projects_filter_widget.dart';
import 'widgets/project_card_widget.dart';
import 'widgets/project_details_dialog_widget.dart';
import '../../../../data/models/week_model.dart';
import '../../../../data/models/project_model.dart';

class ProjectsScreen extends StatelessWidget {
  ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController langController = Provider.of<LanguageController>(context);
    RoadmapDataController roadmapDataController = Provider.of<RoadmapDataController>(context);

    if (roadmapDataController.isLoading) {
      return Scaffold(
        body: LoadingIndicatorWidget(message: 'Loading Projects...'),
      );
    }

    return ChangeNotifierProvider<ProjectsController>(
      create: (context) => ProjectsController(),
      child: Consumer<ProjectsController>(
        builder: (context, controller, child) {
          AppLocalizations loc = AppLocalizations.of(context)!;
          bool isAr = langController.isArabic;

          List<ProjectModel> allProjects = [];
          for (WeekModel w in roadmapDataController.weeks) {
            allProjects.addAll(w.projects);
          }

          List<ProjectModel> filteredProjects = allProjects.where((p) {
            // Filter by status
            if (controller.selectedFilter != 'All' && p.status != controller.selectedFilter) {
              return false;
            }
            // Search query
            if (controller.searchQuery.isNotEmpty) {
              String name = (isAr ? p.nameAr : p.nameEn).toLowerCase();
              String desc = (isAr ? p.descriptionAr : p.descriptionEn).toLowerCase();
              String q = controller.searchQuery.toLowerCase();
              if (!name.contains(q) && !desc.contains(q)) return false;
            }
            return true;
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text(loc.translate('projects')),
              elevation: 0,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ProjectsFilterWidget(
                      selectedFilter: controller.selectedFilter,
                      onFilterChanged: (f) => controller.setFilter(f),
                      onSearchChanged: (q) => controller.setSearchQuery(q),
                    ),
                    SizedBox(height: 16),
                    Expanded(
                      child: filteredProjects.isEmpty
                          ? EmptyStateWidget(
                              title: loc.translate('noDataFound'),
                              icon: Icons.folder_open,
                            )
                          : ListView.builder(
                              itemCount: filteredProjects.length,
                              itemBuilder: (context, index) {
                                ProjectModel proj = filteredProjects[index];

                                return ProjectCardWidget(
                                  project: proj,
                                  isArabic: isAr,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => ProjectDetailsDialogWidget(
                                        project: proj,
                                        isArabic: isAr,
                                        roadmapDataController: roadmapDataController,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
