import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:prepared_academy/models/notifications_model.dart';
import 'package:prepared_academy/providers/notification_provider.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:provider/provider.dart';

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

    Future.microtask(
        () => context.read<NotificationProvider>().getNotifications());
  }

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
        appBar: AppBar(title: const Text("Notifications")),
        body: Consumer<NotificationProvider>(builder: (context, provider, __) {
          return GroupedListView<GetNotificationModel, String>(
            elements: provider.getNotificationModel,
            groupBy: (element) => element.time!.substring(0, 10),
            groupComparator: (value1, value2) => value2.compareTo(value1),
            order: GroupedListOrder.ASC,
            groupSeparatorBuilder: (value) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value),
            ),
            itemBuilder: (c, notification) {
              return Column(
                children: [
                  ListTile(
                    tileColor: notification.status == 0
                        ? kBlue.withOpacity(0.05)
                        : null,
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        notification.status == 0
                            ? const CircleAvatar(
                                backgroundColor: kBlue,
                                radius: 3,
                              )
                            : const SizedBox()
                      ],
                    ),
                    title: Text(
                      notification.message!,
                      style: TextStyle(
                          color: notification.status == 0 ? kBlue : null),
                    ),
                    trailing:
                        Image.asset(AppConstants.REMOVE_NOTI_ICON, height: 25),
                    onTap: () {},
                  ),
                  const Divider(height: 5)
                ],
              );
            },
          );
        }));
  }
}
