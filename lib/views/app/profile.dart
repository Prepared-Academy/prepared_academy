import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prepared_academy/themes/color_theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget ProfileAppBar() {
    return AppBar(
      foregroundColor: kWhite,
      automaticallyImplyLeading: false,
      backgroundColor: kWhite,
      title: Text(
        'Profile Page',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileAppBar(),
          ],
        ),
      ),
    );
  }
}
