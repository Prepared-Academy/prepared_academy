// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'Prepared Academy';
  // static const String BASE_URL = 'https://hrfhome.app'; // live
  static const String BASE_URL = 'https://thepreparedacademy.com'; // staging
  static const String REGISTRATION_URI = '/api/muser/registration';
  static const String LOGIN_URI = '/api/muser/login';
  static const String LOGOUT_URI = '/api/auth/logout';
  static const String BANNERS_URI = '/api/sites/1/banners';
  static const String STATS_URI = '/api/clinics/';
  static const String CLINICSINFO_URI = '/api/clinics/';
  static const String COUNTRY_URI = '/api/countries/';
  static const String CITY_URI = '/api/cities/';
  static const String ADDSERVICE_URI = '/api/services';
  static const String UPLOAD_URI = '/api/files/upload';
  static const String SERVICEFILECREATE_URI = '/api/services/';
  static const String GETSERVICE_URI = '/api/services/';
  static const String GETCATEGORY_URI = '/api/categories';
  static const String UPDATESERVICE_URI = '/api/services/';
  static const String DELETESERVICE_URI = '/api/services/';
  static const String DELETESERVICEFILE_URI = '/api/services/';
  static const String SERVICESSEARCH_URI =
      '/api/services?offset=0&limit=10000&sort[column]=title&sort[order]=asc&fields[clinic_id][value]=';
  static const String CATEGORY_URI =
      '/api/categories?offset=0&limit=10000&sort[column]=title&sort[order]=asc';
  static const String SUBCATEGORY_URI =
      '/api/subcategories?offset=0&limit=10000&sort[column]=title&sort[order]=asc';

  // Availability Apis

  static const String ADDDAY_URI = '/api/clinics/';
  static const String GETTIME_URI = "/api/clinics/";

// Notification Apis

  static const String NOTIFICATIONSEARCH_URI =
      '/api/notifications/db?offset=0&limit=1000000&sort[column]=read_at&sort[order]=asc';
  static const String MARKASREAD_URI = '/api/notifications/db/';
  static const String MARKALLASREAD_URI = '/api/notifications/db/markAllAsRead';

  // sharePreference
  static const String ONBOARDING = 'onboarding';
  static const String TOKEN = 'token';
  static const String USER = 'user';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String HOME_ADDRESS = 'home_address';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String GUEST_MODE = 'guest_mode';

  // order status
  static const String PENDING = 'pending';
  static const String CONFIRMED = 'confirmed';
  static const String PROCESSING = 'processing';
  static const String PROCESSED = 'processed';
  static const String DELIVERED = 'delivered';
  static const String FAILED = 'failed';
  static const String RETURNED = 'returned';
  static const String CANCELLED = 'canceled';
  static const String OUT_FOR_DELIVERY = 'out_for_delivery';
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String THEME = 'theme';
  static const String TOPIC = 'WIKWIK CLINIC';

  // Images
  static const String LOGOWITHTEXT_IMAGE = "assets/images/logowithtext.png";

  static const String LOGO_IMAGE = "assets/images/logo.png";
  static const String DEMOPOST_IMAGE = "assets/images/demopost.jpg";
  static const String SERVICE = "images/service.png";
  static const String CLIENTS_IMAGE = "images/clients.png";
  static const String APPOINTMENT_IMAGE = "images/appointment.png";
  static const String ADDIMAGE_PLACEHOLDER = "images/addlogo.png";
  static const String CHAPTERSBACK1_IMAGE = "assets/images/chapters.jpg";

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
}
