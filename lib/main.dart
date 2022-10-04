import 'package:flutter/material.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:one_context/one_context.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: OneContext().builder,
      navigatorKey: OneContext().key,
      debugShowCheckedModeBanner: false,
      title: 'Prepared Academy',
      theme: ThemeData(primaryColor: kPrimaryColor),
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.PROFILE,
    );
  }
}
