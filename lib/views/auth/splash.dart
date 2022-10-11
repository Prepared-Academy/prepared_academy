import 'package:flutter/material.dart';
import 'package:prepared_academy/repos/splash_repo.dart';

import '../../utils/app_constants.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SplashRepo splashRepo = SplashRepo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppConstants.LOGO_ONLY,
              height: 120,
            ),
          ),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Image.asset(
                AppConstants.LOGO_IMAGE,
                height: 25,
              ))
        ],
      ),
    );
  }
}
