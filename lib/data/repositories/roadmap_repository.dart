import '../data_sources/roadmap_local_data_source.dart';
import '../data_sources/firestore_data_source.dart';
import '../models/week_model.dart';
import '../models/task_model.dart';
import '../models/post_model.dart';
import '../models/user_progress_model.dart';
import '../models/achievement_model.dart';
import '../models/project_model.dart';

class RoadmapRepository {
  FirestoreDataSource firestoreDataSource = FirestoreDataSource();

  Future<UserProgressModel> getUserProgress() async {
    UserProgressModel? saved = await firestoreDataSource.fetchUserProgress();
    if (saved != null) {
      return updateStreakIfNeeded(saved);
    }
    String uid = firestoreDataSource.currentUserId ?? 'guest';
    UserProgressModel initial = UserProgressModel(
      userId: uid,
      taskStates: {},
      projectStates: {},
      postStates: {},
      weekStates: {},
      currentWeek: 1,
      userXp: 0,
      streakDays: 1,
      lastActiveDate: DateTime.now().toIso8601String().split('T')[0],
    );
    await firestoreDataSource.saveUserProgress(initial);
    return initial;
  }

  UserProgressModel updateStreakIfNeeded(UserProgressModel progress) {
    String todayStr = DateTime.now().toIso8601String().split('T')[0];
    if (progress.lastActiveDate == todayStr) return progress;

    int newStreak = progress.streakDays;
    if (progress.lastActiveDate.isNotEmpty) {
      DateTime lastDate = DateTime.tryParse(progress.lastActiveDate) ?? DateTime.now();
      int diffInDays = DateTime.now().difference(lastDate).inDays;
      if (diffInDays == 1) {
        newStreak += 1;
      } else if (diffInDays > 1) {
        newStreak = 1;
      }
    } else {
      newStreak = 1;
    }

    UserProgressModel updated = progress.copyWith(
      streakDays: newStreak,
      lastActiveDate: todayStr,
    );
    firestoreDataSource.saveUserProgress(updated);
    return updated;
  }

  List<WeekModel> combineRoadmapWithProgress(UserProgressModel userProgress) {
    List<WeekModel> baseRoadmap = RoadmapLocalDataSource.getRawRoadmap();

    List<WeekModel> combined = [];
    for (WeekModel week in baseRoadmap) {
      // Restore tasks
      List<TaskModel> updatedTasks = week.tasks.map((task) {
        bool completed = userProgress.taskStates[task.id] ?? false;
        return task.copyWith(isCompleted: completed);
      }).toList();

      // Restore projects
      List<ProjectModel> updatedProjects = week.projects.map((proj) {
        Map<String, dynamic>? projData = userProgress.projectStates[proj.id];
        if (projData != null) {
          String status = projData['status'] ?? proj.status;
          String repoUrl = projData['repoUrl'] ?? proj.repoUrl;
          String notes = projData['notes'] ?? proj.notes;
          List<bool> chkStatus = projData['checklistStatus'] != null
              ? List<bool>.from(projData['checklistStatus'])
              : proj.checklistStatus;
          return proj.copyWith(
            status: status,
            repoUrl: repoUrl,
            notes: notes,
            checklistStatus: chkStatus,
          );
        }
        return proj;
      }).toList();

      // Restore posts
      List<PostModel> updatedPosts = week.posts.map((post) {
        Map<String, dynamic>? postData = userProgress.postStates[post.id];
        if (postData != null) {
          String status = postData['status'] ?? post.status;
          String url = postData['postUrl'] ?? post.postUrl;
          return post.copyWith(status: status, postUrl: url);
        }
        return post;
      }).toList();

      // Restore week level state
      Map<String, dynamic>? weekData = userProgress.weekStates['week_${week.weekNumber}'];
      String reviewNotes = weekData?['reviewNotes'] ?? week.reviewNotes;
      bool isTestCompleted = weekData?['isTestCompleted'] ?? week.isTestCompleted;
      bool isWeekCompleted = weekData?['isWeekCompleted'] ?? week.isWeekCompleted;

      WeekModel updatedWeek = week.copyWith(
        tasks: updatedTasks,
        projects: updatedProjects,
        posts: updatedPosts,
        reviewNotes: reviewNotes,
        isTestCompleted: isTestCompleted,
        isWeekCompleted: isWeekCompleted,
      );

      combined.add(updatedWeek);
    }
    return combined;
  }

  Future<UserProgressModel> saveTaskToggle(
    UserProgressModel progress,
    String taskId,
    bool isCompleted,
  ) async {
    Map<String, bool> newTaskStates = Map<String, bool>.from(progress.taskStates);
    newTaskStates[taskId] = isCompleted;

    int xpDelta = isCompleted ? 10 : -10;
    int newXp = (progress.userXp + xpDelta).clamp(0, 999999);

    UserProgressModel updated = progress.copyWith(
      taskStates: newTaskStates,
      userXp: newXp,
    );
    await firestoreDataSource.saveUserProgress(updated);
    return updated;
  }

  Future<UserProgressModel> saveProjectData(
    UserProgressModel progress,
    String projectId,
    Map<String, dynamic> projectData,
  ) async {
    Map<String, Map<String, dynamic>> newProjectStates = Map.from(progress.projectStates);
    newProjectStates[projectId] = projectData;

    int newXp = progress.userXp;
    if (projectData['status'] == 'Completed') {
      newXp += 50;
    }

    UserProgressModel updated = progress.copyWith(
      projectStates: newProjectStates,
      userXp: newXp,
    );
    await firestoreDataSource.saveUserProgress(updated);
    return updated;
  }

  Future<UserProgressModel> savePostData(
    UserProgressModel progress,
    String postId,
    Map<String, dynamic> postData,
  ) async {
    Map<String, Map<String, dynamic>> newPostStates = Map.from(progress.postStates);
    newPostStates[postId] = postData;

    int newXp = progress.userXp;
    if (postData['status'] == 'Published') {
      newXp += 30;
    }

    UserProgressModel updated = progress.copyWith(
      postStates: newPostStates,
      userXp: newXp,
    );
    await firestoreDataSource.saveUserProgress(updated);
    return updated;
  }

  Future<UserProgressModel> saveWeekData(
    UserProgressModel progress,
    int weekNumber,
    Map<String, dynamic> weekData,
  ) async {
    Map<String, Map<String, dynamic>> newWeekStates = Map.from(progress.weekStates);
    newWeekStates['week_$weekNumber'] = weekData;

    int newXp = progress.userXp;
    if (weekData['isWeekCompleted'] == true) {
      newXp += 100;
    }

    UserProgressModel updated = progress.copyWith(
      weekStates: newWeekStates,
      userXp: newXp,
    );
    await firestoreDataSource.saveUserProgress(updated);
    return updated;
  }

  Future<void> resetAllProgress() async {
    await firestoreDataSource.resetUserProgress();
  }

  List<AchievementModel> calculateAchievements(UserProgressModel progress, List<WeekModel> weeks) {
    List<AchievementModel> achievements = RoadmapLocalDataSource.getInitialAchievements();

    int totalCompletedTasks = progress.taskStates.values.where((v) => v).length;
    int completedWeeksCount = weeks.where((w) => w.isWeekCompleted).length;
    bool phase1Completed = weeks.where((w) => w.phaseNumber == 1 && w.isWeekCompleted).length == 6;

    int completedProjects = 0;
    for (WeekModel w in weeks) {
      completedProjects += w.projects.where((p) => p.status == 'Completed').length;
    }

    int publishedPosts = 0;
    for (WeekModel w in weeks) {
      publishedPosts += w.posts.where((p) => p.status == 'Published').length;
    }

    bool phase4Completed = weeks.where((w) => w.phaseNumber == 4 && w.isWeekCompleted).length == 4;

    return achievements.map((ach) {
      bool unlocked = false;
      if (ach.id == 'ach_first_step' && totalCompletedTasks >= 1) unlocked = true;
      if (ach.id == 'ach_week_warrior' && completedWeeksCount >= 1) unlocked = true;
      if (ach.id == 'ach_core_master' && phase1Completed) unlocked = true;
      if (ach.id == 'ach_project_builder' && completedProjects >= 5) unlocked = true;
      if (ach.id == 'ach_social_sharer' && publishedPosts >= 5) unlocked = true;
      if (ach.id == 'ach_streak_7' && progress.streakDays >= 7) unlocked = true;
      if (ach.id == 'ach_flutter_pro' && phase4Completed) unlocked = true;

      return AchievementModel(
        id: ach.id,
        titleEn: ach.titleEn,
        titleAr: ach.titleAr,
        descriptionEn: ach.descriptionEn,
        descriptionAr: ach.descriptionAr,
        iconName: ach.iconName,
        requiredXp: ach.requiredXp,
        isUnlocked: unlocked,
      );
    }).toList();
  }
}
