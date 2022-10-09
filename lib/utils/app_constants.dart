// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'WIKWIK CLINIC';
  // static const String BASE_URL = 'https://hrfhome.app'; // live
  static const String BASE_URL = 'https://staging.wikwik.app'; // staging
  static const String USER_ID = 'userId';
  static const String NAME = 'name';
  static const String REGISTRATION_URI = '/api/clinics/register';
  static const String LOGIN_URI = '/api/auth/login';
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

  // static List<LanguageModel> languages = [
  //   LanguageModel(
  //       imageUrl: '',
  //       languageName: 'English',
  //       countryCode: 'US',
  //       languageCode: 'en'),
  //   LanguageModel(
  //       imageUrl: '',
  //       languageName: 'Arabic',
  //       countryCode: 'AE',
  //       languageCode: 'ar'),
  // ];

  // Week days
  List<String> dayOfWeek = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  // Images
  static const String LOGO_IMAGE = "assets/images/preparedlogotxt.png";
  static const String LOGO_ONLY = "assets/images/preparedlogoonly.png";
  static const String LOGIN_STUD = "assets/images/edu1.png";
  static const String MYREWARDS = "assets/images/medal.png";
  static const String MYREPORTS = "assets/images/clipboard.png";
  static const String ABOUTUS = "assets/images/conversation.png";
  static const String TERMS = "assets/images/terms-and-conditions.png";
  static const String PASS_RESET = "assets/images/reset-password.png";
  static const String LOG_OUT = "assets/images/turn-off.png";
  static const String RESET_PAGE = "assets/images/secure.png";
  static const String STUD1 = "assets/images/student1.jpg";
  static const String FEED1 = "assets/images/feed1.png";
  static const String QUIZICON = "assets/images/answer.png";
  static const String TESTICON = "assets/images/test.png";
  static const String ATTENDANCEICON = "assets/images/calendar.png";
  static const String REPORTICON = "assets/images/mortarboard.png";
  static const String ASSIGNMENTICON = "assets/images/assignment.png";
  static const String REWARDSTAR = "assets/images/starrating.png";
  static const String DATASCIENCE = "assets/images/datascience.png";
  static const String PROGRAMMER = "assets/images/programmer.png";
  static const String ROBOTICS = "assets/images/robotics.png";
}
