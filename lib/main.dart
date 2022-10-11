import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/providers/splash_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/setup.dart';
import 'package:prepared_academy/themes/app_theme.dart';
import 'package:prepared_academy/widgets/remove_scroll_glow.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInit();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    //color set to transperent or set your own color
    statusBarIconBrightness: Brightness.dark,
    //set brightness for icons, like dark background light icons
  ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SplashProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: const MyApp(),
  ));
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
