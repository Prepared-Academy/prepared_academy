import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/auth_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/app_theme.dart';
import 'package:one_context/one_context.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ], child: const MyApp()),
  );
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
      theme: appTheme,
      routes: AppRoutes.getAppRoutes(),
      initialRoute: AppRoutes.LOGIN,
    );
  }
}
