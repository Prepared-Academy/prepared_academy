import 'package:flutter/material.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Prepared Academy',
      theme: ThemeData(primaryColor: kPrimaryColor),
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.LOGIN,
    );
  }
}
