// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Flutter Roadmap';

  @override
  String get appSubtitle => 'Your Personal Flutter Learning Journey';

  @override
  String get login => 'Login';

  @override
  String get signup => 'Sign Up';

  @override
  String get email => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get fullName => 'Full Name';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get forgotPasswordTitle => 'Reset Password';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email to receive a password reset link';

  @override
  String get sendResetLink => 'Send Reset Link';

  @override
  String get dontHaveAccount => 'Don\'t have an account? ';

  @override
  String get alreadyHaveAccount => 'Already have an account? ';

  @override
  String get logout => 'Logout';

  @override
  String get home => 'Dashboard';

  @override
  String get roadmap => 'Roadmap';

  @override
  String get projects => 'Projects';

  @override
  String get statistics => 'Statistics';

  @override
  String get settings => 'Settings';

  @override
  String get overallProgress => 'Overall Progress';

  @override
  String get currentWeek => 'Current Week';

  @override
  String get currentPhase => 'Current Phase';

  @override
  String get completedWeeks => 'Completed Weeks';

  @override
  String get remainingWeeks => 'Remaining Weeks';

  @override
  String get completedTasks => 'Completed Tasks';

  @override
  String get remainingTasks => 'Remaining Tasks';

  @override
  String get completedProjects => 'Completed Projects';

  @override
  String get continueLearning => 'Continue Learning';

  @override
  String get recentAchievements => 'Recent Achievements';

  @override
  String get xpPoints => 'XP Points';

  @override
  String get dayStreak => 'Day Streak';

  @override
  String get allPhases => 'All Phases';

  @override
  String get allFilters => 'All';

  @override
  String get phase1 => 'Phase 1: Core (Weeks 1-6)';

  @override
  String get phase2 => 'Phase 2: Advanced (Weeks 7-10)';

  @override
  String get phase3 => 'Phase 3: Professional (Weeks 11-14)';

  @override
  String get phase4 => 'Phase 4: Production (Weeks 15-18)';

  @override
  String get phase5 => 'Phase 5: Advanced Extras (Weeks 19-24)';

  @override
  String get laterTopics => 'Later / Advanced Topics';

  @override
  String get laterTopicsSubtitle =>
      'Weeks 19–24: Advanced topics after Capstone release.';

  @override
  String get week => 'Week';

  @override
  String get statusNotStarted => 'Not Started';

  @override
  String get statusInProgress => 'In Progress';

  @override
  String get statusCompleted => 'Completed';

  @override
  String get statusInPreparation => 'In Preparation';

  @override
  String get statusReady => 'Ready';

  @override
  String get statusPublished => 'Published';

  @override
  String get weeklyObjectives => 'Weekly Objectives';

  @override
  String get weeklyChecklist => 'Weekly Checklist';

  @override
  String get dailySchedule => 'Weekly Learning Schedule';

  @override
  String get satSun => 'Sat + Sun: Core Principle & Examples';

  @override
  String get monTue => 'Mon + Tue: Project 1 Implementation';

  @override
  String get wed => 'Wed: Project 2 Setup & Challenge';

  @override
  String get thu => 'Thu: Dart OOP Mastery';

  @override
  String get fri => 'Fri: Project 2 Finish & Review & Posts';

  @override
  String get weeklyProjects => 'Weekly Projects';

  @override
  String get linkedInPosts => 'LinkedIn Posts';

  @override
  String get project1Post => 'Project 1 Showcase Post';

  @override
  String get project2Post => 'Project 2 Showcase Post';

  @override
  String get principlePost => 'Core Principle Deep Dive Post';

  @override
  String get postUrl => 'Post URL';

  @override
  String get savePostUrl => 'Save Link';

  @override
  String get githubRepoUrl => 'GitHub Repository URL';

  @override
  String get personalNotes => 'Personal Notes';

  @override
  String get personalNotesHint =>
      'Notes, key takeaways, architectural decisions...';

  @override
  String get saveNotes => 'Save Notes';

  @override
  String get weeklyReview => 'Weekly Review';

  @override
  String get weeklyTest => 'Weekly Completion Test';

  @override
  String get testConfirmation =>
      'I have written all checklist items, projects, and Dart OOP examples by hand.';

  @override
  String get markWeekCompleted => 'Mark Week as Completed';

  @override
  String get weekCompletedMessage => 'Congratulations! Week completed!';

  @override
  String get cannotCompleteWeekMessage =>
      'Complete all checklist items, projects, and review to finish this week.';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get arabic => 'العربية (Arabic)';

  @override
  String get english => 'English';

  @override
  String get accountInfo => 'Account Information';

  @override
  String get appInfo => 'Application Information';

  @override
  String get resetProgress => 'Reset Learning Progress';

  @override
  String get resetProgressConfirm =>
      'Are you sure you want to reset all your progress? This action cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get save => 'Save';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get search => 'Search';

  @override
  String get filter => 'Filter';

  @override
  String get errorOccurred => 'An error occurred';

  @override
  String get success => 'Success';

  @override
  String get invalidEmail => 'Please enter a valid email';

  @override
  String get passwordTooShort => 'Password must be at least 6 characters';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get requiredField => 'This field is required';

  @override
  String get noDataFound => 'No data available';

  @override
  String get notesSaved => 'Notes saved successfully';

  @override
  String get postSaved => 'Post updated successfully';

  @override
  String get projectSaved => 'Project updated successfully';

  @override
  String get progressResetSuccess => 'Progress reset successfully';

  @override
  String get version => 'Version 1.0.0';

  @override
  String get developerNote => 'Built with Flutter & Firebase';

  @override
  String welcomeUser(Object name) {
    return 'Welcome, $name!';
  }

  @override
  String get statusLabel => 'Status: ';
}
