import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../themes/color_theme.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  Widget ListtileNotifications() {
    return Container(
      height: 80,
      child: Card(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: kPrimaryColor.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: CircleAvatar(
              child: Image.network(
                'https://avatars.githubusercontent.com/u/37553901?v=4',
                height: 80.0,
                width: 80.0,
              ),
            ),
          ),
          title: Text(
            'New Quiz Swssion started',
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            'new quiz session has started, join now!!!!!!',
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        foregroundColor: kWhite,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Notifications",
          style: TextStyle(
              color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        backgroundColor: kWhite,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListtileNotifications(),
          ListtileNotifications(),
          ListtileNotifications(),
          ListtileNotifications(),
          ListtileNotifications(),
          ListtileNotifications(),
          ListtileNotifications(),
        ],
      )),
    );
  }
}
