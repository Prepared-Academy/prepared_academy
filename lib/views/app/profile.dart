import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Widget ProfileAppBar() {
    return AppBar(
      foregroundColor: kWhite,
      automaticallyImplyLeading: false,
      backgroundColor: kWhite,
      title: const Text(
        'Profile Page',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
      ),
    );
  }

  Widget UserProfImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          'https://avatars.githubusercontent.com/u/37553901?v=4',
          height: 120.0,
          width: 110.0,
        ),
      ),
    );
  }

  Widget UserProfDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Aashini Venugopal',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w800, color: kWhite),
          ),
          Text(
            'aashini@gmail.com',
            style: TextStyle(fontSize: 14, color: kWhite),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Gulf Asian Public School',
            style: TextStyle(fontSize: 14, color: kWhite),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            'Grade 6',
            style: TextStyle(fontSize: 14, color: kWhite),
          ),
        ],
      ),
    );
  }

  Widget ProfileListings() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.MYREWARDS,
                  width: 25,
                ),
                title: RichText(
                    text: const TextSpan(
                        text: 'My Rewards',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                      TextSpan(
                        text: '\nView rewards and points',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      )
                    ])),
              ),
            ),
            const Divider(
              height: 5,
              thickness: 0.08,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            Card(
              margin: EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.MYREPORTS,
                  width: 25,
                ),
                title: RichText(
                    text: const TextSpan(
                        text: 'My Reports',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                      TextSpan(
                        text: '\nView rewards and points',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      )
                    ])),
              ),
            ),
            const Divider(
              height: 5,
              thickness: 0.08,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            Card(
              margin: EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.ABOUTUS,
                  width: 25,
                ),
                title: RichText(
                    text: const TextSpan(
                        text: 'About Us',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                      TextSpan(
                        text: '\nView rewards and points',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      )
                    ])),
              ),
            ),
            const Divider(
              height: 5,
              thickness: 0.08,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            Card(
              margin: EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.TERMS,
                  width: 25,
                ),
                title: RichText(
                    text: const TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                      TextSpan(
                        text: '\nView rewards and points',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      )
                    ])),
              ),
            ),
            const Divider(
              height: 3,
              thickness: 0.08,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            Card(
              margin: EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.PASS_RESET,
                  width: 25,
                ),
                title: RichText(
                    text: const TextSpan(
                        text: 'Password Reset',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                      TextSpan(
                        text: '\nView rewards and points',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      )
                    ])),
              ),
            ),
            const Divider(
              height: 3,
              thickness: 0.08,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            Card(
              margin: EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.LOG_OUT,
                  width: 25,
                ),
                title: RichText(
                    text: const TextSpan(
                        text: 'Log Out',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w600),
                        children: <TextSpan>[
                      TextSpan(
                        text: '\nView rewards and points',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      )
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ProfileLogo() {
    return Align(
      alignment: Alignment.center,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppConstants.LOGO_IMAGE,
              width: 140,
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 11.0, bottom: 10),
              child: Text(
                "PreparEd App Version 1.1.0",
                style: TextStyle(fontSize: 10),
              ),
            )
          ],
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
            "Profile",
            style: TextStyle(color: kBlack, fontSize: 18),
          ),
          backgroundColor: kWhite,
        ),
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Card(
                      elevation: 0,
                      color: kPrimaryColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          UserProfImage(),
                          UserProfDetails(),
                        ],
                      ),
                    ),
                  ),
                  ProfileListings(),
                  // Spacer(),
                  ProfileLogo(),
                ],
              ),
            )
          ],
        ));
  }
}
