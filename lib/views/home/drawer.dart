// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import '../../widgets.dart/icon_button.dart';

class DrawerBody extends StatelessWidget {
  DrawerBody({super.key});

  List<Map<String, dynamic>> menuList = [
    {
      "name": "My Profile",
      "imageicon": AppConstants.ACCOUNT_ICON,
    },
    {
      "name": "Exams & Assignments",
      "imageicon": AppConstants.EXAM_ICON,
    },
    {
      "name": "Live Classes",
      "imageicon": AppConstants.LIVE_ICON,
    },
    {
      "name": "Subscribe Now",
      "imageicon": AppConstants.SUBSCRIBE_ICON,
    },
    {
      "name": "Parental App",
      "imageicon": AppConstants.PARENTAL_ICON,
    },
    {
      "name": "Reports",
      "imageicon": AppConstants.REPORTS_ICON,
    },
    {
      "name": "PreparEd Eye",
      "imageicon": AppConstants.EYE_ICON,
    },
    {
      "name": "Share App",
      "imageicon": AppConstants.SHARE_ICON,
    },
    {
      "name": "Feedback",
      "imageicon": AppConstants.FEEDBACK_ICON,
    },
    {
      "name": "Contact Us",
      "imageicon": AppConstants.CONTACT_ICON,
    },
    {
      "name": "Settings",
      "imageicon": AppConstants.SETTING_ICON,
    },
  ];

  Widget _listTile(String imageIcon, String text, void Function()? onTap) =>
      ListTile(
        minLeadingWidth: 25,
        onTap: onTap,
        dense: true,
        leading: Image.asset(imageIcon, height: 20),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 15,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Image.asset(
                      AppConstants.LOGOWITHTEXT_IMAGE,
                      width: 100,
                      fit: BoxFit.contain,
                    ),
                    const Spacer(),
                    CustomIconButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      iconImage: AppConstants.CLOSE_ICON,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: menuList.length,
                itemBuilder: (context, index) {
                  return _listTile(menuList[index]["imageicon"],
                      menuList[index]["name"], () {});
                },
                separatorBuilder: (context, index) {
                  return const Divider(indent: 50, height: 0, thickness: 0.5);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
