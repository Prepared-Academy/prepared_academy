import 'package:flutter/material.dart';
import 'package:prepared_academy/models/inapp_notification.dart';
import 'package:prepared_academy/providers/inappnotification_provider.dart';
import 'package:provider/provider.dart';

import '../../themes/color_theme.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  // Widget listtileNotifications() {
  //   return SizedBox(
  //     height: 80,
  //     child: Card(
  //       color: Colors.white.withOpacity(0.85),
  //       shape: RoundedRectangleBorder(
  //         side: BorderSide(
  //           color: kPrimaryColor.withOpacity(0.1),
  //         ),
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       child: ListTile(
  //         leading: ClipRRect(
  //           borderRadius: BorderRadius.circular(20.0),
  //           child: CircleAvatar(
  //             child: Image.network(
  //               'https://avatars.githubusercontent.com/u/37553901?v=4',
  //               height: 80.0,
  //               width: 80.0,
  //             ),
  //           ),
  //         ),
  //         title: const Text(
  //           'New Quiz Swssion started',
  //           textAlign: TextAlign.start,
  //         ),
  //         subtitle: const Text(
  //           'new quiz session has started, join now!!!!!!',
  //           textAlign: TextAlign.start,
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
          Consumer<InAppNotificationProvider>(builder: (context, provider, __) {
        return SingleChildScrollView(
            child: Column(children: [
          SizedBox(
              height: 80,
              child: Card(
                  color: Colors.white.withOpacity(0.85),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: kPrimaryColor.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Consumer<InAppNotificationProvider>(
                      builder: (context, provider, __) {
                    return ListTile(
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
                        provider.inappNotificationModel.notifications!.first
                            .message!,
                        textAlign: TextAlign.start,
                      ),
                      subtitle: const Text(
                        'new quiz session has started, join now!!!!!!',
                        textAlign: TextAlign.start,
                      ),
                    );
                  })))
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
            );
      }),
    );
  }
}
