import 'package:flutter/material.dart';
import '../data/repositories/roadmap_repository.dart';
import '../data/models/week_model.dart';
import '../data/models/user_progress_model.dart';
import '../data/models/achievement_model.dart';
import '../data/models/project_model.dart';

class RoadmapDataController extends ChangeNotifier {
  RoadmapRepository roadmapRepository = RoadmapRepository();

  UserProgressModel? userProgress;
  List<WeekModel> weeks = [];
  List<AchievementModel> achievements = [];
  bool isLoading = true;
  String? errorMessage;

  RoadmapDataController() {
    loadData();
  }

  Future<void> loadData() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      userProgress = await roadmapRepository.getUserProgress();
      weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
      achievements = roadmapRepository.calculateAchievements(userProgress!, weeks);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  WeekModel? get currentWeekModel {
    if (weeks.isEmpty) return null;
    int curWeekNum = userProgress?.currentWeek ?? 1;
    return weeks.firstWhere(
      (w) => w.weekNumber == curWeekNum,
      orElse: () => weeks.first,
    );
  }

  double get overallProgressPercentage {
    if (weeks.isEmpty) return 0.0;
    List<WeekModel> mainRoadmapWeeks = weeks.where((w) => !w.isLaterTopic).toList();
    if (mainRoadmapWeeks.isEmpty) return 0.0;
    double sum = 0.0;
    for (WeekModel w in mainRoadmapWeeks) {
      sum += w.completionPercentage;
    }
    return sum / mainRoadmapWeeks.length;
  }

  int get completedWeeksCount {
    return weeks.where((w) => w.isWeekCompleted).length;
  }

  int get totalCompletedTasks {
    if (userProgress == null) return 0;
    return userProgress!.taskStates.values.where((v) => v).length;
  }

  int get totalTasksCount {
    int count = 0;
    for (WeekModel w in weeks) {
      count += w.tasks.length;
    }
    return count;
  }

  int get totalCompletedProjects {
    int count = 0;
    for (WeekModel w in weeks) {
      count += w.projects.where((p) => p.status == 'Completed').length;
    }
    return count;
  }

  int get totalPublishedPosts {
    int count = 0;
    for (WeekModel w in weeks) {
      count += w.posts.where((p) => p.status == 'Published').length;
    }
    return count;
  }

  double getPhaseProgressPercentage(int phaseNumber) {
    List<WeekModel> phaseWeeks = weeks.where((w) => w.phaseNumber == phaseNumber).toList();
    if (phaseWeeks.isEmpty) return 0.0;
    double sum = 0.0;
    for (WeekModel w in phaseWeeks) {
      sum += w.completionPercentage;
    }
    return sum / phaseWeeks.length;
  }

  Future<void> toggleTask(String taskId, bool isCompleted) async {
    if (userProgress == null) return;
    userProgress = await roadmapRepository.saveTaskToggle(userProgress!, taskId, isCompleted);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    achievements = roadmapRepository.calculateAchievements(userProgress!, weeks);
    notifyListeners();
  }

  Future<void> updateProjectStatus(String projectId, String status) async {
    if (userProgress == null) return;
    Map<String, dynamic> projData = Map.from(userProgress!.projectStates[projectId] ?? {});
    projData['status'] = status;
    userProgress = await roadmapRepository.saveProjectData(userProgress!, projectId, projData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    achievements = roadmapRepository.calculateAchievements(userProgress!, weeks);
    notifyListeners();
  }

  Future<void> updateProjectRepoUrl(String projectId, String repoUrl) async {
    if (userProgress == null) return;
    Map<String, dynamic> projData = Map.from(userProgress!.projectStates[projectId] ?? {});
    projData['repoUrl'] = repoUrl;
    userProgress = await roadmapRepository.saveProjectData(userProgress!, projectId, projData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    notifyListeners();
  }

  Future<void> updateProjectNotes(String projectId, String notes) async {
    if (userProgress == null) return;
    Map<String, dynamic> projData = Map.from(userProgress!.projectStates[projectId] ?? {});
    projData['notes'] = notes;
    userProgress = await roadmapRepository.saveProjectData(userProgress!, projectId, projData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    notifyListeners();
  }

  Future<void> toggleProjectChecklist(String projectId, int itemIndex, bool completed) async {
    if (userProgress == null) return;
    ProjectModel? targetProj;
    for (WeekModel w in weeks) {
      for (ProjectModel p in w.projects) {
        if (p.id == projectId) {
          targetProj = p;
          break;
        }
      }
    }
    if (targetProj == null) return;

    List<bool> currentChecklist = List<bool>.from(targetProj.checklistStatus);
    if (itemIndex < currentChecklist.length) {
      currentChecklist[itemIndex] = completed;
    }

    Map<String, dynamic> projData = Map.from(userProgress!.projectStates[projectId] ?? {});
    projData['checklistStatus'] = currentChecklist;

    userProgress = await roadmapRepository.saveProjectData(userProgress!, projectId, projData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    notifyListeners();
  }

  Future<void> updatePostStatus(String postId, String status) async {
    if (userProgress == null) return;
    Map<String, dynamic> postData = Map.from(userProgress!.postStates[postId] ?? {});
    postData['status'] = status;
    userProgress = await roadmapRepository.savePostData(userProgress!, postId, postData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    achievements = roadmapRepository.calculateAchievements(userProgress!, weeks);
    notifyListeners();
  }

  Future<void> updatePostUrl(String postId, String postUrl) async {
    if (userProgress == null) return;
    Map<String, dynamic> postData = Map.from(userProgress!.postStates[postId] ?? {});
    postData['postUrl'] = postUrl;
    userProgress = await roadmapRepository.savePostData(userProgress!, postId, postData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    notifyListeners();
  }

  Future<void> updateWeeklyReview(int weekNumber, String reviewNotes) async {
    if (userProgress == null) return;
    Map<String, dynamic> weekData = Map.from(userProgress!.weekStates['week_$weekNumber'] ?? {});
    weekData['reviewNotes'] = reviewNotes;
    userProgress = await roadmapRepository.saveWeekData(userProgress!, weekNumber, weekData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    notifyListeners();
  }

  Future<void> toggleWeeklyTest(int weekNumber, bool isTestCompleted) async {
    if (userProgress == null) return;
    Map<String, dynamic> weekData = Map.from(userProgress!.weekStates['week_$weekNumber'] ?? {});
    weekData['isTestCompleted'] = isTestCompleted;
    userProgress = await roadmapRepository.saveWeekData(userProgress!, weekNumber, weekData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    notifyListeners();
  }

  Future<bool> markWeekAsCompleted(int weekNumber) async {
    if (userProgress == null) return false;
    WeekModel week = weeks.firstWhere((w) => w.weekNumber == weekNumber);

    bool allTasksDone = week.tasks.every((t) => t.isCompleted);
    bool allProjectsDone = week.projects.every((p) => p.status == 'Completed');
    bool reviewDone = week.reviewNotes.trim().isNotEmpty;
    bool testDone = week.isTestCompleted;

    if (!allTasksDone || !allProjectsDone || !reviewDone || !testDone) {
      return false;
    }

    Map<String, dynamic> weekData = Map.from(userProgress!.weekStates['week_$weekNumber'] ?? {});
    weekData['isWeekCompleted'] = true;

    int nextWeek = weekNumber < 18 ? weekNumber + 1 : weekNumber;

    UserProgressModel updatedProg = userProgress!.copyWith(currentWeek: nextWeek);
    userProgress = await roadmapRepository.saveWeekData(updatedProg, weekNumber, weekData);
    weeks = roadmapRepository.combineRoadmapWithProgress(userProgress!);
    achievements = roadmapRepository.calculateAchievements(userProgress!, weeks);
    notifyListeners();
    return true;
  }

  Future<void> resetAllUserProgress() async {
    await roadmapRepository.resetAllProgress();
    await loadData();
  }
}
