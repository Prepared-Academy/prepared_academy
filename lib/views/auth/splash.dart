import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/splash_provider.dart';
import 'package:provider/provider.dart';

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
    Future.microtask(() => context.read<SplashProvider>().init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: FadeAnimation(
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
                AppConstants.LOGOWITHTEXT_IMAGE,
                height: 25,
              ))
        ],
      ),
    );
  }
}
