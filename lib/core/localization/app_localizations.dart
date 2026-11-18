import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      'appName': 'Flutter Roadmap',
      'appSubtitle': 'Your Personal Flutter Learning Journey',
      'login': 'Login',
      'signup': 'Sign Up',
      'email': 'Email Address',
      'password': 'Password',
      'confirmPassword': 'Confirm Password',
      'fullName': 'Full Name',
      'forgotPassword': 'Forgot Password?',
      'forgotPasswordTitle': 'Reset Password',
      'forgotPasswordSubtitle': 'Enter your email to receive a password reset link',
      'sendResetLink': 'Send Reset Link',
      'dontHaveAccount': 'Don\'t have an account? ',
      'alreadyHaveAccount': 'Already have an account? ',
      'logout': 'Logout',
      'home': 'Dashboard',
      'roadmap': 'Roadmap',
      'projects': 'Projects',
      'statistics': 'Statistics',
      'settings': 'Settings',
      'overallProgress': 'Overall Progress',
      'currentWeek': 'Current Week',
      'currentPhase': 'Current Phase',
      'completedWeeks': 'Completed Weeks',
      'remainingWeeks': 'Remaining Weeks',
      'completedTasks': 'Completed Tasks',
      'remainingTasks': 'Remaining Tasks',
      'completedProjects': 'Completed Projects',
      'continueLearning': 'Continue Learning',
      'recentAchievements': 'Recent Achievements',
      'xpPoints': 'XP Points',
      'dayStreak': 'Day Streak',
      'allPhases': 'All Phases',
      'allFilters': 'All',
      'phase1': 'Phase 1: Core (Weeks 1-6)',
      'phase2': 'Phase 2: Advanced (Weeks 7-10)',
      'phase3': 'Phase 3: Professional (Weeks 11-14)',
      'phase4': 'Phase 4: Production (Weeks 15-18)',
      'phase5': 'Phase 5: Advanced Extras (Weeks 19-24)',
      'laterTopics': 'Later / Advanced Topics',
      'laterTopicsSubtitle': 'Weeks 19–24: Advanced topics after Capstone release.',
      'week': 'Week',
      'statusNotStarted': 'Not Started',
      'statusInProgress': 'In Progress',
      'statusCompleted': 'Completed',
      'statusInPreparation': 'In Preparation',
      'statusReady': 'Ready',
      'statusPublished': 'Published',
      'weeklyObjectives': 'Weekly Objectives',
      'weeklyChecklist': 'Weekly Checklist',
      'dailySchedule': 'Weekly Learning Schedule',
      'satSun': 'Sat + Sun: Core Principle & Examples',
      'monTue': 'Mon + Tue: Project 1 Implementation',
      'wed': 'Wed: Project 2 Setup & Challenge',
      'thu': 'Thu: Dart OOP Mastery',
      'fri': 'Fri: Project 2 Finish & Review & Posts',
      'weeklyProjects': 'Weekly Projects',
      'linkedInPosts': 'LinkedIn Posts',
      'project1Post': 'Project 1 Showcase Post',
      'project2Post': 'Project 2 Showcase Post',
      'principlePost': 'Core Principle Deep Dive Post',
      'postUrl': 'Post URL',
      'savePostUrl': 'Save Link',
      'githubRepoUrl': 'GitHub Repository URL',
      'personalNotes': 'Personal Notes',
      'personalNotesHint': 'Notes, key takeaways, architectural decisions...',
      'saveNotes': 'Save Notes',
      'weeklyReview': 'Weekly Review',
      'weeklyTest': 'Weekly Completion Test',
      'testConfirmation': 'I have written all checklist items, projects, and Dart OOP examples by hand.',
      'markWeekCompleted': 'Mark Week as Completed',
      'weekCompletedMessage': 'Congratulations! Week completed!',
      'cannotCompleteWeekMessage': 'Complete all checklist items, projects, and review to finish this week.',
      'language': 'Language',
      'theme': 'Theme',
      'lightMode': 'Light Mode',
      'darkMode': 'Dark Mode',
      'arabic': 'العربية (Arabic)',
      'english': 'English',
      'accountInfo': 'Account Information',
      'appInfo': 'Application Information',
      'resetProgress': 'Reset Learning Progress',
      'resetProgressConfirm': 'Are you sure you want to reset all your progress? This action cannot be undone.',
      'cancel': 'Cancel',
      'confirm': 'Confirm',
      'save': 'Save',
      'edit': 'Edit',
      'delete': 'Delete',
      'search': 'Search',
      'filter': 'Filter',
      'errorOccurred': 'An error occurred',
      'success': 'Success',
      'invalidEmail': 'Please enter a valid email',
      'passwordTooShort': 'Password must be at least 6 characters',
      'passwordsDoNotMatch': 'Passwords do not match',
      'requiredField': 'This field is required',
      'noDataFound': 'No data available',
      'notesSaved': 'Notes saved successfully',
      'postSaved': 'Post updated successfully',
      'projectSaved': 'Project updated successfully',
      'progressResetSuccess': 'Progress reset successfully',
      'version': 'Version 1.0.0',
      'developerNote': 'Built with Flutter & Firebase',
      'welcomeUser': 'Welcome, {name}!',
      'statusLabel': 'Status: ',
    },
    'ar': {
      'appName': 'خطة تعلم فلاتر',
      'appSubtitle': 'رحلتك الشخصية لتعلم فلاتر',
      'login': 'تسجيل الدخول',
      'signup': 'إنشاء حساب',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'confirmPassword': 'تأكيد كلمة المرور',
      'fullName': 'الاسم الكامل',
      'forgotPassword': 'نسيت كلمة المرور؟',
      'forgotPasswordTitle': 'إعادة ضبط كلمة المرور',
      'forgotPasswordSubtitle': 'أدخل بريدك الإلكتروني لاستلام رابط إعادة الضبط',
      'sendResetLink': 'إرسال رابط الضبط',
      'dontHaveAccount': 'ليس لديك حساب؟ ',
      'alreadyHaveAccount': 'لديك حساب بالفعل؟ ',
      'logout': 'تسجيل الخروج',
      'home': 'الرئيسية',
      'roadmap': 'الخطة',
      'projects': 'المشاريع',
      'statistics': 'الإحصائيات',
      'settings': 'الإعدادات',
      'overallProgress': 'التقدم الإجمالي',
      'currentWeek': 'الأسبوع الحالي',
      'currentPhase': 'المرحلة الحالية',
      'completedWeeks': 'الأسابيع المكتملة',
      'remainingWeeks': 'الأسابيع المتبقية',
      'completedTasks': 'المهام المكتملة',
      'remainingTasks': 'المهام المتبقية',
      'completedProjects': 'المشاريع المكتملة',
      'continueLearning': 'متابعة التعلم',
      'recentAchievements': 'أحدث الإنجازات',
      'xpPoints': 'نقاط XP',
      'dayStreak': 'أيام التتابع',
      'allPhases': 'جميع المراحل',
      'allFilters': 'الكل',
      'phase1': 'المرحلة 1: الأساسيات (الأسابيع 1-6)',
      'phase2': 'المرحلة 2: المستوى المتقدم (الأسابيع 7-10)',
      'phase3': 'المرحلة 3: المستوى الاحترافي (الأسابيع 11-14)',
      'phase4': 'المرحلة 4: الإنتاج والنشر (الأسابيع 15-18)',
      'phase5': 'المرحلة 5: مواضيع إضافية متقدمة (الأسابيع 19-24)',
      'laterTopics': 'مواضيع متقدمة لاحقة',
      'laterTopicsSubtitle': 'الأسابيع 19–24: مواضيع متقدمة بعد إطلاق مشروع التخرج.',
      'week': 'الأسبوع',
      'statusNotStarted': 'لم يبدأ',
      'statusInProgress': 'قيد التقدم',
      'statusCompleted': 'مكتمل',
      'statusInPreparation': 'قيد التحضير',
      'statusReady': 'جاهز',
      'statusPublished': 'تم النشر',
      'weeklyObjectives': 'أهداف الأسبوع',
      'weeklyChecklist': 'قائمة المهام الأسبوعية',
      'dailySchedule': 'الجدول الأسبوعي للتعلم',
      'satSun': 'السبت + الأحد: فهم المبدأ وتطبيق أمثلة صغيرة',
      'monTue': 'الاثنين + الثلاثاء: تنفيذ المشروع الأول',
      'wed': 'الأربعاء: البدء بالمشروع الثاني (التحدي)',
      'thu': 'الخميس: Dart OOP فقط',
      'fri': 'الجمعة: إنهاء المشروع الثاني + المراجعة + 3 بوستات',
      'weeklyProjects': 'مشاريع الأسبوع',
      'linkedInPosts': 'منشورات لينكد إن',
      'project1Post': 'منشور المشروع الأول',
      'project2Post': 'منشور المشروع الثاني',
      'principlePost': 'منشور شرح المبدأ الأساسي',
      'postUrl': 'رابط المنشور',
      'savePostUrl': 'حفظ الرابط',
      'githubRepoUrl': 'رابط المستودع على جيت هاب',
      'personalNotes': 'ملاحظات شخصية',
      'personalNotesHint': 'ملاحظات، النقاط الرئيسية، القرارات المعمارية...',
      'saveNotes': 'حفظ الملاحظات',
      'weeklyReview': 'المراجعة الأسبوعية',
      'weeklyTest': 'اختبار نهاية الأسبوع',
      'testConfirmation': 'لقد كتبت جميع عناصر القائمة، والمشاريع، وأمثلة Dart OOP بيدي.',
      'markWeekCompleted': 'تحديد الأسبوع كمكتمل',
      'weekCompletedMessage': 'تهانينا! تم إكمال الأسبوع بنجاح!',
      'cannotCompleteWeekMessage': 'أكمل جميع نقاط قائمة المهام والمشاريع والمراجعة لإكمال هذا الأسبوع.',
      'language': 'اللغة',
      'theme': 'المظهر',
      'lightMode': 'الوضع الفاتح',
      'darkMode': 'الوضع الداكن',
      'arabic': 'العربية (Arabic)',
      'english': 'English',
      'accountInfo': 'معلومات الحساب',
      'appInfo': 'معلومات التطبيق',
      'resetProgress': 'إعادة ضبط تقدم التعلم',
      'resetProgressConfirm': 'هل أنت تأكد من إمكانية إعادة ضبط كافة بيانات التقدم؟ لا يمكن التراجع عن هذا الإجراء.',
      'cancel': 'إلغاء',
      'confirm': 'تأكيد',
      'save': 'حفظ',
      'edit': 'تعديل',
      'delete': 'حذف',
      'search': 'بحث',
      'filter': 'تصفية',
      'errorOccurred': 'حدث خطأ ما',
      'success': 'تم بنجاح',
      'invalidEmail': 'يرجى إدخال بريد إلكتروني صحيح',
      'passwordTooShort': 'كلمة المرور يجب أن تكون 6 أحرف على الأقل',
      'passwordsDoNotMatch': 'كلمتا المرور غير متطابقتين',
      'requiredField': 'هذا الحقل مطلوب',
      'noDataFound': 'لا تتوفر بيانات حالياً',
      'notesSaved': 'تم حفظ الملاحظات بنجاح',
      'postSaved': 'تم تحديث المنشور بنجاح',
      'projectSaved': 'تم تحديث المشروع بنجاح',
      'progressResetSuccess': 'تمت إعادة ضبط التقدم بنجاح',
      'version': 'الإصدار 1.0.0',
      'developerNote': 'تم التطوير باستخدام فلاتر و فيربيز',
      'welcomeUser': 'أهلاً بك، {name}!',
      'statusLabel': 'الحالة: ',
    },
  };

  String translate(String key) {
    return localizedValues[locale.languageCode]?[key] ?? localizedValues['en']?[key] ?? key;
  }

  String translateWithParam(String key, String paramName, String paramValue) {
    String text = translate(key);
    return text.replaceAll('{$paramName}', paramValue);
  }

  String translateStatus(String status) {
    switch (status) {
      case 'Completed':
        return translate('statusCompleted');
      case 'In Progress':
        return translate('statusInProgress');
      case 'Not Started':
        return translate('statusNotStarted');
      case 'In Preparation':
        return translate('statusInPreparation');
      case 'Ready':
        return translate('statusReady');
      case 'Published':
        return translate('statusPublished');
      default:
        return status;
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
