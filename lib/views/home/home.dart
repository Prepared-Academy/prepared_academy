import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/views/home/drawer.dart';
import 'package:prepared_academy/widgets.dart/buttons.dart';
import 'package:prepared_academy/widgets.dart/icon_button.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _logoWithText() => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset(AppConstants.LOGOWITHTEXT_IMAGE),
      );

  Widget _notificationButton() => CustomIconButton(
        onTap: () {},
        iconImage: AppConstants.NOTIFICATION_ICON,
      );

  Widget _bookmarkButton() => CustomIconButton(
        onTap: () {},
        iconImage: AppConstants.BOOKMARK_ICON,
      );

  Widget _menuButton() => Builder(
        builder: (context) => CustomIconButton(
          onTap: () => Scaffold.of(context).openEndDrawer(),
          iconImage: AppConstants.MENU_ICON,
        ),
      );

  Widget _storyWidget() => Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      color: kPrimaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadedScaleAnimation(child: const Text("Perals of wisdom")),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                3,
                (index) => FadedScaleAnimation(
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                color: Colors.grey,
                                spreadRadius: 1)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          radius: 30,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.grey.shade50,
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));

  Widget _suggestions() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadedScaleAnimation(
                child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Suggested for you"),
            )),
            const SizedBox(height: 10),
            SizedBox(
              height: 45,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) => SizedBox(
                      width: 300,
                      child: Card(
                        elevation: 0,
                        color: Colors.grey.withOpacity(0.2),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        shape: const StadiumBorder(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Mathematics".toUpperCase(),
                                    style: const TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    "Mathematics",
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              MiniElevatedButton(
                                  onPressed: () {}, text: "Learn")
                            ],
                          ),
                        ),
                      ))),
            ),
          ],
        ),
      );

  Widget _newsFeed() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              radius: 15,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "PreparEd",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            const LikeButton(
                              likeCount: 45,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: double.maxFinite,
                        child: Image.asset(
                          AppConstants.DEMOPOST_IMAGE,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Top 7 Best Automatic Subtitle Generators",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Learn how to rank your e-commence website on Google",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Since we started using Semrush, our keywords are much more targeted and we are seeing much more traffic and activity.",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: _logoWithText(),
        actions: [
          _bookmarkButton(),
          _notificationButton(),
          _menuButton(),
        ],
      ),
      endDrawer: DrawerBody(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _storyWidget(),
            _suggestions(),
            _newsFeed(),
          ],
        ),
      ),
    );
  }
}
