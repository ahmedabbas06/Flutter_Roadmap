class UserProgressModel {
  String userId;
  Map<String, bool> taskStates;
  Map<String, Map<String, dynamic>> projectStates;
  Map<String, Map<String, dynamic>> postStates;
  Map<String, Map<String, dynamic>> weekStates;
  int currentWeek;
  int userXp;
  int streakDays;
  String lastActiveDate;

  UserProgressModel({
    required this.userId,
    required this.taskStates,
    required this.projectStates,
    required this.postStates,
    required this.weekStates,
    this.currentWeek = 1,
    this.userXp = 0,
    this.streakDays = 1,
    this.lastActiveDate = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'taskStates': taskStates,
      'projectStates': projectStates,
      'postStates': postStates,
      'weekStates': weekStates,
      'currentWeek': currentWeek,
      'userXp': userXp,
      'streakDays': streakDays,
      'lastActiveDate': lastActiveDate,
    };
  }

  factory UserProgressModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> rawTaskStates = json['taskStates'] ?? {};
    Map<String, bool> parsedTaskStates = {};
    rawTaskStates.forEach((key, value) {
      parsedTaskStates[key] = value as bool;
    });

    Map<String, dynamic> rawProjectStates = json['projectStates'] ?? {};
    Map<String, Map<String, dynamic>> parsedProjectStates = {};
    rawProjectStates.forEach((key, value) {
      parsedProjectStates[key] = Map<String, dynamic>.from(value as Map);
    });

    Map<String, dynamic> rawPostStates = json['postStates'] ?? {};
    Map<String, Map<String, dynamic>> parsedPostStates = {};
    rawPostStates.forEach((key, value) {
      parsedPostStates[key] = Map<String, dynamic>.from(value as Map);
    });

    Map<String, dynamic> rawWeekStates = json['weekStates'] ?? {};
    Map<String, Map<String, dynamic>> parsedWeekStates = {};
    rawWeekStates.forEach((key, value) {
      parsedWeekStates[key] = Map<String, dynamic>.from(value as Map);
    });

    return UserProgressModel(
      userId: json['userId'] ?? '',
      taskStates: parsedTaskStates,
      projectStates: parsedProjectStates,
      postStates: parsedPostStates,
      weekStates: parsedWeekStates,
      currentWeek: json['currentWeek'] ?? 1,
      userXp: json['userXp'] ?? 0,
      streakDays: json['streakDays'] ?? 1,
      lastActiveDate: json['lastActiveDate'] ?? '',
    );
  }

  UserProgressModel copyWith({
    String? userId,
    Map<String, bool>? taskStates,
    Map<String, Map<String, dynamic>>? projectStates,
    Map<String, Map<String, dynamic>>? postStates,
    Map<String, Map<String, dynamic>>? weekStates,
    int? currentWeek,
    int? userXp,
    int? streakDays,
    String? lastActiveDate,
  }) {
    return UserProgressModel(
      userId: userId ?? this.userId,
      taskStates: taskStates ?? this.taskStates,
      projectStates: projectStates ?? this.projectStates,
      postStates: postStates ?? this.postStates,
      weekStates: weekStates ?? this.weekStates,
      currentWeek: currentWeek ?? this.currentWeek,
      userXp: userXp ?? this.userXp,
      streakDays: streakDays ?? this.streakDays,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
    );
  }
}
