import 'task_model.dart';
import 'project_model.dart';
import 'post_model.dart';

class WeekModel {
  int weekNumber;
  int phaseNumber;
  String phaseNameEn;
  String phaseNameAr;
  String titleEn;
  String titleAr;
  List<String> mainTopicsEn;
  List<String> mainTopicsAr;
  List<TaskModel> tasks;
  List<ProjectModel> projects;
  List<PostModel> posts;
  String saturdaySundayEn;
  String saturdaySundayAr;
  String mondayTuesdayEn;
  String mondayTuesdayAr;
  String wednesdayEn;
  String wednesdayAr;
  String thursdayOopEn;
  String thursdayOopAr;
  String fridayEn;
  String fridayAr;
  String reviewPromptEn;
  String reviewPromptAr;
  String reviewNotes;
  bool isTestCompleted;
  bool isWeekCompleted;
  bool isLaterTopic;

  WeekModel({
    required this.weekNumber,
    required this.phaseNumber,
    required this.phaseNameEn,
    required this.phaseNameAr,
    required this.titleEn,
    required this.titleAr,
    required this.mainTopicsEn,
    required this.mainTopicsAr,
    required this.tasks,
    required this.projects,
    required this.posts,
    required this.saturdaySundayEn,
    required this.saturdaySundayAr,
    required this.mondayTuesdayEn,
    required this.mondayTuesdayAr,
    required this.wednesdayEn,
    required this.wednesdayAr,
    required this.thursdayOopEn,
    required this.thursdayOopAr,
    required this.fridayEn,
    required this.fridayAr,
    required this.reviewPromptEn,
    required this.reviewPromptAr,
    this.reviewNotes = '',
    this.isTestCompleted = false,
    this.isWeekCompleted = false,
    this.isLaterTopic = false,
  });

  double get completionPercentage {
    if (tasks.isEmpty) return isWeekCompleted ? 1.0 : 0.0;
    int completedTasks = tasks.where((t) => t.isCompleted).length;
    double taskProgress = completedTasks / tasks.length;
    
    int completedProjectsCount = projects.where((p) => p.status == 'Completed').length;
    double projectProgress = projects.isEmpty ? 1.0 : completedProjectsCount / projects.length;

    double reviewTestProgress = (reviewNotes.trim().isNotEmpty ? 0.5 : 0.0) + (isTestCompleted ? 0.5 : 0.0);

    return (taskProgress * 0.5) + (projectProgress * 0.3) + (reviewTestProgress * 0.2);
  }

  String get calculatedStatus {
    if (isWeekCompleted) return 'Completed';
    double pct = completionPercentage;
    if (pct > 0.0) return 'In Progress';
    return 'Not Started';
  }

  WeekModel copyWith({
    int? weekNumber,
    int? phaseNumber,
    String? phaseNameEn,
    String? phaseNameAr,
    String? titleEn,
    String? titleAr,
    List<String>? mainTopicsEn,
    List<String>? mainTopicsAr,
    List<TaskModel>? tasks,
    List<ProjectModel>? projects,
    List<PostModel>? posts,
    String? saturdaySundayEn,
    String? saturdaySundayAr,
    String? mondayTuesdayEn,
    String? mondayTuesdayAr,
    String? wednesdayEn,
    String? wednesdayAr,
    String? thursdayOopEn,
    String? thursdayOopAr,
    String? fridayEn,
    String? fridayAr,
    String? reviewPromptEn,
    String? reviewPromptAr,
    String? reviewNotes,
    bool? isTestCompleted,
    bool? isWeekCompleted,
    bool? isLaterTopic,
  }) {
    return WeekModel(
      weekNumber: weekNumber ?? this.weekNumber,
      phaseNumber: phaseNumber ?? this.phaseNumber,
      phaseNameEn: phaseNameEn ?? this.phaseNameEn,
      phaseNameAr: phaseNameAr ?? this.phaseNameAr,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      mainTopicsEn: mainTopicsEn ?? this.mainTopicsEn,
      mainTopicsAr: mainTopicsAr ?? this.mainTopicsAr,
      tasks: tasks ?? this.tasks,
      projects: projects ?? this.projects,
      posts: posts ?? this.posts,
      saturdaySundayEn: saturdaySundayEn ?? this.saturdaySundayEn,
      saturdaySundayAr: saturdaySundayAr ?? this.saturdaySundayAr,
      mondayTuesdayEn: mondayTuesdayEn ?? this.mondayTuesdayEn,
      mondayTuesdayAr: mondayTuesdayAr ?? this.mondayTuesdayAr,
      wednesdayEn: wednesdayEn ?? this.wednesdayEn,
      wednesdayAr: wednesdayAr ?? this.wednesdayAr,
      thursdayOopEn: thursdayOopEn ?? this.thursdayOopEn,
      thursdayOopAr: thursdayOopAr ?? this.thursdayOopAr,
      fridayEn: fridayEn ?? this.fridayEn,
      fridayAr: fridayAr ?? this.fridayAr,
      reviewPromptEn: reviewPromptEn ?? this.reviewPromptEn,
      reviewPromptAr: reviewPromptAr ?? this.reviewPromptAr,
      reviewNotes: reviewNotes ?? this.reviewNotes,
      isTestCompleted: isTestCompleted ?? this.isTestCompleted,
      isWeekCompleted: isWeekCompleted ?? this.isWeekCompleted,
      isLaterTopic: isLaterTopic ?? this.isLaterTopic,
    );
  }
}
