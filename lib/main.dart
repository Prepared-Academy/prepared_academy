import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/providers/home_provider.dart';
import 'package:prepared_academy/providers/splash_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/setup.dart';
import 'package:prepared_academy/themes/app_theme.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/internet_check.dart';
import 'package:prepared_academy/widgets/remove_scroll_glow.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InternetPopup().initialize();

  // await removeAll();

  RxSharedPreferences(
    SharedPreferences.getInstance(),
    kReleaseMode ? null : const RxSharedPreferencesEmptyLogger(),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  configLoading();

  await setupInit();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ClassActivityProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      builder: (context, myWidget) {
        myWidget = OneContext().builder(context, myWidget);
        myWidget = EasyLoading.init()(context, myWidget);
        return myWidget;
      },
      navigatorKey: OneContext().key,
      title: 'Prepared Academy',
      theme: appTheme,
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.SPLASHSCREEN,
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 40.0
    ..radius = 10.0
    ..progressColor = kPrimaryColor
    ..backgroundColor = Colors.white
    ..indicatorColor = kPrimaryColor
    ..textColor = Colors.black
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}
