import 'package:animation_wrappers/animations/scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/profile_provider.dart';
import 'package:provider/provider.dart';
import '../../themes/color_theme.dart';
import '../../utils/app_constants.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  Widget profileAppBar() {
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

  Widget userProfImage() {
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

  Widget userProfDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: Consumer<ProfileProvider>(
        builder: ((context, provider, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "provider.profileModel!.name",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w800, color: kWhite),
              ),
              Text(
                provider.profileModel.email.toString(),
                style: const TextStyle(fontSize: 14, color: kWhite),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                provider.profileModel.schoolName.toString(),
                style: const TextStyle(fontSize: 14, color: kWhite),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                provider.profileModel.grade.toString(),
                style: const TextStyle(fontSize: 14, color: kWhite),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget profileListings() {
    return Expanded(
      child: Column(
        children: [
          ScaleAnimation(
            child: Card(
              margin: const EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.ACCOUNT_ICON,
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
          ),
          const Divider(
            height: 5,
            thickness: 0.08,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          ScaleAnimation(
            child: Card(
              margin: const EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.ACCOUNT_ICON,
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
          ),
          const Divider(
            height: 5,
            thickness: 0.08,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          ScaleAnimation(
            child: Card(
              margin: const EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.ACCOUNT_ICON,
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
          ),
          const Divider(
            height: 5,
            thickness: 0.08,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          ScaleAnimation(
            child: Card(
              margin: const EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.ACCOUNT_ICON,
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
          ),
          const Divider(
            height: 3,
            thickness: 0.08,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          ScaleAnimation(
            child: Card(
              margin: const EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.ACCOUNT_ICON,
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
          ),
          const Divider(
            height: 3,
            thickness: 0.08,
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          ScaleAnimation(
            child: Card(
              margin: const EdgeInsets.all(2),
              elevation: 0,
              child: ListTile(
                leading: Image.asset(
                  AppConstants.ACCOUNT_ICON,
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
          ),
        ],
      ),
    );
  }

  Widget profileLogo() {
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
              padding: EdgeInsets.only(left: 11.0, bottom: 10),
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
                  ScaleAnimation(
                    child: Card(
                      elevation: 0,
                      color: kPrimaryColor,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          userProfImage(),
                          userProfDetails(),
                        ],
                      ),
                    ),
                  ),
                  profileListings(),
                  // Spacer(),
                  profileLogo(),
                ],
              ),
            )
          ],
        ));
  }
}
