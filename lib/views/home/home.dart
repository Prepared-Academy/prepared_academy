import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/views/home/drawer.dart';
import 'package:prepared_academy/widgets/icon_button.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final scrollController = ScrollController();
  final listShowItemDuration = const Duration(milliseconds: 0);

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
            FadeAnimation(child: const Text("Perals of wisdom")),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                3,
                (index) => ScaleAnimation(
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
            FadeAnimation(
                child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Suggested for you"),
            )),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => ScaleAnimation(
                  child: SizedBox(
                    width: 350,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: kBorder)),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: Text(
                            "Mathematics".toUpperCase(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: const Text(
                            "Understanding elementary shapes",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: kPrimaryColor,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: kPrimaryColor,
                            size: 15,
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
      );

  Widget _newsFeed() => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeAnimation(child: const Text("Newsfeed")),
            LiveList(
                delay: const Duration(milliseconds: 50) * 5,
                shrinkWrap: true,
                itemCount: 3,
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index, animation) {
                  return FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(animation),
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, -0.1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 20),
                        decoration: BoxDecoration(
                            border: Border.all(color: kBorder),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: SizedBox(
                                height: 200,
                                width: double.maxFinite,
                                child: Image.asset(
                                  AppConstants.DEMOPOST_IMAGE,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
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
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Top 7 Best Automatic Subtitle Generators",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  const Text(
                                    "Learn how to rank your e-commence website on Google",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
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
                    ),
                  );
                })),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
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