import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Flutter Roadmap'**
  String get appName;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your Personal Flutter Learning Journey'**
  String get appSubtitle;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to receive a password reset link'**
  String get forgotPasswordSubtitle;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get sendResetLink;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get home;

  /// No description provided for @roadmap.
  ///
  /// In en, this message translates to:
  /// **'Roadmap'**
  String get roadmap;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @overallProgress.
  ///
  /// In en, this message translates to:
  /// **'Overall Progress'**
  String get overallProgress;

  /// No description provided for @currentWeek.
  ///
  /// In en, this message translates to:
  /// **'Current Week'**
  String get currentWeek;

  /// No description provided for @currentPhase.
  ///
  /// In en, this message translates to:
  /// **'Current Phase'**
  String get currentPhase;

  /// No description provided for @completedWeeks.
  ///
  /// In en, this message translates to:
  /// **'Completed Weeks'**
  String get completedWeeks;

  /// No description provided for @remainingWeeks.
  ///
  /// In en, this message translates to:
  /// **'Remaining Weeks'**
  String get remainingWeeks;

  /// No description provided for @completedTasks.
  ///
  /// In en, this message translates to:
  /// **'Completed Tasks'**
  String get completedTasks;

  /// No description provided for @remainingTasks.
  ///
  /// In en, this message translates to:
  /// **'Remaining Tasks'**
  String get remainingTasks;

  /// No description provided for @completedProjects.
  ///
  /// In en, this message translates to:
  /// **'Completed Projects'**
  String get completedProjects;

  /// No description provided for @continueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue Learning'**
  String get continueLearning;

  /// No description provided for @recentAchievements.
  ///
  /// In en, this message translates to:
  /// **'Recent Achievements'**
  String get recentAchievements;

  /// No description provided for @xpPoints.
  ///
  /// In en, this message translates to:
  /// **'XP Points'**
  String get xpPoints;

  /// No description provided for @dayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get dayStreak;

  /// No description provided for @allPhases.
  ///
  /// In en, this message translates to:
  /// **'All Phases'**
  String get allPhases;

  /// No description provided for @allFilters.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilters;

  /// No description provided for @phase1.
  ///
  /// In en, this message translates to:
  /// **'Phase 1: Core (Weeks 1-6)'**
  String get phase1;

  /// No description provided for @phase2.
  ///
  /// In en, this message translates to:
  /// **'Phase 2: Advanced (Weeks 7-10)'**
  String get phase2;

  /// No description provided for @phase3.
  ///
  /// In en, this message translates to:
  /// **'Phase 3: Professional (Weeks 11-14)'**
  String get phase3;

  /// No description provided for @phase4.
  ///
  /// In en, this message translates to:
  /// **'Phase 4: Production (Weeks 15-18)'**
  String get phase4;

  /// No description provided for @phase5.
  ///
  /// In en, this message translates to:
  /// **'Phase 5: Advanced Extras (Weeks 19-24)'**
  String get phase5;

  /// No description provided for @laterTopics.
  ///
  /// In en, this message translates to:
  /// **'Later / Advanced Topics'**
  String get laterTopics;

  /// No description provided for @laterTopicsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Weeks 19–24: Advanced topics after Capstone release.'**
  String get laterTopicsSubtitle;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @statusNotStarted.
  ///
  /// In en, this message translates to:
  /// **'Not Started'**
  String get statusNotStarted;

  /// No description provided for @statusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get statusInProgress;

  /// No description provided for @statusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get statusCompleted;

  /// No description provided for @statusInPreparation.
  ///
  /// In en, this message translates to:
  /// **'In Preparation'**
  String get statusInPreparation;

  /// No description provided for @statusReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get statusReady;

  /// No description provided for @statusPublished.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get statusPublished;

  /// No description provided for @weeklyObjectives.
  ///
  /// In en, this message translates to:
  /// **'Weekly Objectives'**
  String get weeklyObjectives;

  /// No description provided for @weeklyChecklist.
  ///
  /// In en, this message translates to:
  /// **'Weekly Checklist'**
  String get weeklyChecklist;

  /// No description provided for @dailySchedule.
  ///
  /// In en, this message translates to:
  /// **'Weekly Learning Schedule'**
  String get dailySchedule;

  /// No description provided for @satSun.
  ///
  /// In en, this message translates to:
  /// **'Sat + Sun: Core Principle & Examples'**
  String get satSun;

  /// No description provided for @monTue.
  ///
  /// In en, this message translates to:
  /// **'Mon + Tue: Project 1 Implementation'**
  String get monTue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed: Project 2 Setup & Challenge'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu: Dart OOP Mastery'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri: Project 2 Finish & Review & Posts'**
  String get fri;

  /// No description provided for @weeklyProjects.
  ///
  /// In en, this message translates to:
  /// **'Weekly Projects'**
  String get weeklyProjects;

  /// No description provided for @linkedInPosts.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn Posts'**
  String get linkedInPosts;

  /// No description provided for @project1Post.
  ///
  /// In en, this message translates to:
  /// **'Project 1 Showcase Post'**
  String get project1Post;

  /// No description provided for @project2Post.
  ///
  /// In en, this message translates to:
  /// **'Project 2 Showcase Post'**
  String get project2Post;

  /// No description provided for @principlePost.
  ///
  /// In en, this message translates to:
  /// **'Core Principle Deep Dive Post'**
  String get principlePost;

  /// No description provided for @postUrl.
  ///
  /// In en, this message translates to:
  /// **'Post URL'**
  String get postUrl;

  /// No description provided for @savePostUrl.
  ///
  /// In en, this message translates to:
  /// **'Save Link'**
  String get savePostUrl;

  /// No description provided for @githubRepoUrl.
  ///
  /// In en, this message translates to:
  /// **'GitHub Repository URL'**
  String get githubRepoUrl;

  /// No description provided for @personalNotes.
  ///
  /// In en, this message translates to:
  /// **'Personal Notes'**
  String get personalNotes;

  /// No description provided for @personalNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Notes, key takeaways, architectural decisions...'**
  String get personalNotesHint;

  /// No description provided for @saveNotes.
  ///
  /// In en, this message translates to:
  /// **'Save Notes'**
  String get saveNotes;

  /// No description provided for @weeklyReview.
  ///
  /// In en, this message translates to:
  /// **'Weekly Review'**
  String get weeklyReview;

  /// No description provided for @weeklyTest.
  ///
  /// In en, this message translates to:
  /// **'Weekly Completion Test'**
  String get weeklyTest;

  /// No description provided for @testConfirmation.
  ///
  /// In en, this message translates to:
  /// **'I have written all checklist items, projects, and Dart OOP examples by hand.'**
  String get testConfirmation;

  /// No description provided for @markWeekCompleted.
  ///
  /// In en, this message translates to:
  /// **'Mark Week as Completed'**
  String get markWeekCompleted;

  /// No description provided for @weekCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Week completed!'**
  String get weekCompletedMessage;

  /// No description provided for @cannotCompleteWeekMessage.
  ///
  /// In en, this message translates to:
  /// **'Complete all checklist items, projects, and review to finish this week.'**
  String get cannotCompleteWeekMessage;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'العربية (Arabic)'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @accountInfo.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get accountInfo;

  /// No description provided for @appInfo.
  ///
  /// In en, this message translates to:
  /// **'Application Information'**
  String get appInfo;

  /// No description provided for @resetProgress.
  ///
  /// In en, this message translates to:
  /// **'Reset Learning Progress'**
  String get resetProgress;

  /// No description provided for @resetProgressConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset all your progress? This action cannot be undone.'**
  String get resetProgressConfirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get invalidEmail;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordTooShort;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @requiredField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredField;

  /// No description provided for @noDataFound.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noDataFound;

  /// No description provided for @notesSaved.
  ///
  /// In en, this message translates to:
  /// **'Notes saved successfully'**
  String get notesSaved;

  /// No description provided for @postSaved.
  ///
  /// In en, this message translates to:
  /// **'Post updated successfully'**
  String get postSaved;

  /// No description provided for @projectSaved.
  ///
  /// In en, this message translates to:
  /// **'Project updated successfully'**
  String get projectSaved;

  /// No description provided for @progressResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Progress reset successfully'**
  String get progressResetSuccess;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get version;

  /// No description provided for @developerNote.
  ///
  /// In en, this message translates to:
  /// **'Built with Flutter & Firebase'**
  String get developerNote;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcomeUser(Object name);

  /// No description provided for @statusLabel.
  ///
  /// In en, this message translates to:
  /// **'Status: '**
  String get statusLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
