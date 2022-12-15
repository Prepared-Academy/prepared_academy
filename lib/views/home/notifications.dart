import 'package:flutter/material.dart';
import 'package:prepared_academy/utils/app_constants.dart';

import '../../themes/color_theme.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  Widget listtileNotifications() {
    return SizedBox(
      height: 80,
      child: Card(
        elevation: 0,
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: CircleAvatar(
              backgroundColor: kWhite,
              child: Image.asset(
                AppConstants.NOTIFICATIONS_ICON,
                height: 20.0,
                width: 20.0,
              ),
            ),
          ),
          title: const Text(
            'New Quiz Swssion started',
            textAlign: TextAlign.start,
          ),
          subtitle: const Text(
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
          listtileNotifications(),
          listtileNotifications(),
          listtileNotifications(),
          listtileNotifications(),
          listtileNotifications(),
          listtileNotifications(),
          listtileNotifications(),
        ],
      )),
    );
  }
}
