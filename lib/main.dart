import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/providers/home_provider.dart';
import 'package:prepared_academy/providers/splash_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/setup.dart';
import 'package:prepared_academy/themes/app_theme.dart';
import 'package:prepared_academy/widgets/remove_scroll_glow.dart';
import 'package:provider/provider.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await removeAll();

  RxSharedPreferences(
    SharedPreferences.getInstance(),
    kReleaseMode ? null : const RxSharedPreferencesEmptyLogger(),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

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
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      title: 'Prepared Academy',
      theme: appTheme,
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.SPLASHSCREEN,
    );
  }
}
