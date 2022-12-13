import 'package:animation_wrappers/animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/models/inapp_notification.dart';
import 'package:prepared_academy/providers/home_provider.dart';
import 'package:prepared_academy/providers/inappnotification_provider.dart';
import 'package:prepared_academy/utils/helper.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../themes/color_theme.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        context.read<InAppNotificationProvider>().getInappNotifications());
  }

  Widget listtileNotifications() {
    return Consumer<InAppNotificationProvider>(
        builder: (context, provider, __) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: provider.inappNotificationModel.notifications!.length,
        itemBuilder: (context, index) => ScaleAnimation(
          child: SizedBox(
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
                  provider.inappNotificationModel.notifications![index].message
                      .toString(),
                  textAlign: TextAlign.start,
                ),
                subtitle: Text(
                  " provider.inappNotificationModel.notifications![index].time",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ),
      );
    });
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
      body:
          //   Consumer<InAppNotificationProvider>(builder: (context, provider, __) {
          // return
          SingleChildScrollView(
              child: Column(children: [
        listtileNotifications(),
      ])
              // ListTile(
              //   leading: ClipRRect(
              //     borderRadius: BorderRadius.circular(20.0),
              //     child: CircleAvatar(
              //       child: Image.network(
              //         'https://avatars.githubusercontent.com/u/37553901?v=4',
              //         height: 80.0,
              //         width: 80.0,
              //       ),
              //     ),
              //   ),
              //   title: Text(
              //     "  inappNotificationModel.notifications[index].message!",
              //     textAlign: TextAlign.start,
              //   ),
              //   subtitle: const Text(
              //     'new quiz session has started, join now!!!!!!',
              //     textAlign: TextAlign.start,
              //   ),
              // ),
              ),
    );
  }
}
