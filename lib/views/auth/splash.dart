import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/services/splash_services.dart';

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
    SplashServices.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ScaleAnimation(
              child: Image.asset(
                AppConstants.LOGO_IMAGE,
                height: 120,
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Image.asset(
                AppConstants.TEXTLOGO_IMAGE,
                height: 20,
              ))
        ],
      ),
    );
  }
}
