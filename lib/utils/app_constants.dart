// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'Prepared Academy';
  // static const String BASE_URL = 'https://hrfhome.app'; // live
  static const String BASE_URL = 'https://thepreparedacademy.com'; // staging
  static const String REGISTRATION_URI = '/api/muser/registration';
  static const String LOGIN_URI = '/api/muser/login';
  static const String LOGOUT_URI = '/api/muser/logout';
  static const String CREATE_LOGIN_TIME_URI = '/api/muser/createloginTime';
  static const String UPDATE_LOGOUT_TIME_URI = '/api/muser/updateLogoutTime';
  static const String VERIFY_OTP_URI = '/api/muser/verifyOTP';
  static const String SEND_OTP_URI = '/api/muser/sendOTPMail';
  static const String UPDATE_PASS_URI = '/api/muser/updatePassword';

  static const String STORY_URI = '/api/muser/getDailyFacts';
  static const String BOOKMARKSTORY_URI = '/api/muser/addBookmark';
  static const String REMOVEBOOKMARK_URI = '/api/muser/removeBookmark';

// In Class Acitivities
  static const String INCLASS_SUBJECTS_URI = '/api/muser/getmyinlinesubjects';
  static const String SUBJECT_ACTIVITY_URI = '/api/muser/getStudentActivities';
  static const String ACITVITIES_URI = '/api/muser/getActivityDays';
  static const String GET_ASSIGNMENT_ACTIVITY_URI =
      '/api/muser/getStudentAssignmentActivity';
  static const String ACTIVITY_ASSIGNMENT_SUBMIT_URI =
      '/api/muser/ActivityAssignmentSubmit';
  static const String QUIZ_ACTIVITY_URI = '/api/muser/getstudentquiz';
  static const String ACTIVITY_VIDEO_QUIZ_SUBMIT_URI =
      '/api/muser/activityVideoQuizSubmit';

  static const String GET_TEST_ACTIVITY_URI =
      '/api/muser/getShowClassTestQuestions';

  static const String TEST_ACTIVITY_SUBMIT_URI =
      '/api/muser/ActivityTestSubmitStudents';

  static const String GET_STUDENT_DASHBOARD_URI =
      '/api/muser/getStudentDashboard';

  static const String SAVE_FIREBASE_TOKEN = '/api/muser/save-token';

  static const String LIKE_POSTS_URI = '/api/muser/likeposts';
  static const String UNLIKE_POSTS_URI = '/api/muser/unlikeposts';

  // Student Profile
  static const String PROFILE_URI = '/api/muser/getStudentProfile';
  static const String GETREPORTS_URI = 'api/muser/getStudentReport';

  // Live QUiz
  static const String GET_LIVE_QUIZ_URI = '/api/muser/getLiveQuizes';

  // sharePreference
  static const String ONBOARDING = 'onboarding';
  static const String TOKEN = 'token';
  static const String USER = 'user';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String HOME_ADDRESS = 'home_address';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String GUEST_MODE = 'guest_mode';

  // Images

  static const String DEMOPOST_IMAGE = "assets/images/demopost.jpg";
  static const String SERVICE = "images/service.png";
  static const String CLIENTS_IMAGE = "images/clients.png";
  static const String APPOINTMENT_IMAGE = "images/appointment.png";
  static const String ADDIMAGE_PLACEHOLDER = "images/addlogo.png";
  static const String CHAPTERSBACK1_IMAGE = "assets/images/chapters.jpg";
  static const String PLACEHOLDER_IMAGE = "assets/images/placeholder.png";

// Story

  static const String FACTS_IMAGE = "assets/images/facts.png";
  static const String HISTORY_IMAGE = "assets/images/history.png";
  static const String PROVERBS_IMAGE = "assets/images/proverbs.png";

  // Icons

  static const String NOTIFICATION_ICON = "assets/icons/bell.png";
  static const String MENU_ICON = "assets/icons/menu.png";
  static const String BOOKMARK_ICON = "assets/icons/bookmark.png";
  static const String CLOSE_ICON = "assets/icons/cancel.png";
  static const String LIVE_ICON = "assets/icons/live.png";
  static const String LIVE2_ICON = "assets/icons/live2.png";
  static const String ACCOUNT_ICON = "assets/icons/user.png";
  static const String EXAM_ICON = "assets/icons/exam.png";
  static const String NOTI_ICON = "assets/icons/noti.png";
  static const String REPORTS_ICON = "assets/icons/report.png";
  static const String SUBSCRIBE_ICON = "assets/icons/subscribe.png";
  static const String PARENTAL_ICON = "assets/icons/parental.png";
  static const String SHARE_ICON = "assets/icons/share.png";
  static const String CONTACT_ICON = "assets/icons/contact.png";
  static const String FEEDBACK_ICON = "assets/icons/feedback.png";
  static const String SETTING_ICON = "assets/icons/setting.png";
  static const String EYE_ICON = "assets/icons/eye.png";
  static const String TOPICON1_ICON = "assets/icons/topicon.png";
  static const String INFO_ICON = "assets/icons/info.png";
  static const String REWARDS_ICON = "assets/icons/rewards.png";
  static const String TEST_ICON = "assets/icons/test.png";
  static const String LIVECLASS_ICON = "assets/icons/liveclass.png";
  static const String CHECK_ICON = "assets/icons/check.png";
  static const String LOCK_ICON = "assets/icons/lock.png";
  static const String SLIDES_ICON = "assets/icons/slides.png";
  static const String ADDIMAGE_ICON = "assets/icons/addimage.png";
  static const String FULLNAME_ICON = "assets/icons/fullname.png";
  static const String SCHOOL_ICON = "assets/icons/school.png";
  static const String GRADES_ICON = "assets/icons/grades.png";
  static const String EMAIL_ICON = "assets/icons/email.png";
  static const String PASSWORD_ICON = "assets/icons/password.png";
  static const String ACTIVITYLOCK_ICON = "assets/icons/activitylock.png";
  static const String VIDEOPLAY_ICON = "assets/icons/play.png";
  static const String TROPHY_ICON = "assets/icons/trophy.png";
  static const String NOTIFICATIONS_ICON = "assets/icons/notifications.png";
  static const String LIVE_QUIZ_ICON = "assets/icons/livequiz.png";

  // Logo

  static const String LOGOWITHTEXT_IMAGE = "assets/logo/logowithtext.png";
  static const String TEXTLOGO_IMAGE = "assets/logo/textlogo.png";
  static const String LOGO_IMAGE = "assets/images/logo.png";

  // Profile Page

  static const String MYREWARDS = "assets/icons/medal.png";
  static const String MYREPORTS = "assets/icons/clipboard.png";
  static const String ABOUTUS = "assets/icons/conversation.png";
  static const String TERMS = "assets/icons/terms-and-conditions.png";
  static const String PASS_RESET = "assets/icons/reset-password.png";
  static const String LOG_OUT = "assets/icons/turn-off.png";

  static List<String> gradesList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];

  static List<String> schoolList = [
    'Delhi Private School',
    'Gulf Asian English School',
    'India international School',
    'Pace International School',
    'prepared',
  ];

  static List<Map<String, dynamic>> storyList = [
    {"name": "Facts", "image": AppConstants.FACTS_IMAGE},
    {"name": "History", "image": AppConstants.HISTORY_IMAGE},
    {"name": "Proverbs", "image": AppConstants.PROVERBS_IMAGE},
  ];
}
