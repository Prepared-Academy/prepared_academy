import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/animation/animation_list.dart';
import 'package:prepared_academy/models/get_newsfeed_model.dart';
import 'package:prepared_academy/providers/home_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/views/home/drawer.dart';
import 'package:prepared_academy/views/home/newsfeed.dart';

import 'package:prepared_academy/widgets/icon_button.dart';
import 'package:prepared_academy/widgets/photo_view.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<HomeProvider>().getStory());
    Future.microtask(() => context.read<HomeProvider>().getNewsPost());
  }

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
            FadeAnimation(child: const Text("Pearls of wisdom")),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                AppConstants.storyList.length,
                (index) => ScaleAnimation(
                  child: GestureDetector(
                    onTap: () {
                      context.read<HomeProvider>().storyView(index: index);
                      context.read<HomeProvider>().currentStoryIndex = index;
                      OneContext().pushNamed(AppRoutes.STORYVIEW);
                    },
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
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                              AppConstants.storyList[index]["image"]),
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
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
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
              ),
            ),
          ],
        ),
      );

  Widget newsPost(List<Post> newsList) => SizedBox(
        height: 25,
        child: LiveList(
          delay: animationDurationList,
          shrinkWrap: true,
          itemCount: newsList.length,
          controller: scrollController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index, animation) {
            final posts = newsList[index];
            return AnimationFadeList(
              animation: animation,
              widget: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: kBorder),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        OneContext().push(
                          MaterialPageRoute(
                            builder: (context) => const ViewPhoto(
                              imageProvider: AssetImage(
                                AppConstants.DEMOPOST_IMAGE,
                              ),
                            ),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Container(
                          color: Colors.white,
                          height: 400,
                          width: double.maxFinite,
                          child: Image.asset(
                            posts.title!,
                            fit: BoxFit.cover,
                          ),
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
                                radius: 20,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "PreparEd",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              const LikeButton(
                                likeCount: 45,
                                size: 24,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
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
            );
          },
        ),
      );

  Widget newsFeed() => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeAnimation(child: const Text("Newsfeed")),
            Consumer<HomeProvider>(builder: (context, provider, __) {
              return LiveList(
                delay: animationDurationList,
                shrinkWrap: true,
                itemCount: provider.getNewsFeedData[0].posts!.length,
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index, animation) {
                  return AnimationFadeList(
                    animation: animation,
                    widget: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: kBorder),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              OneContext().push(
                                MaterialPageRoute(
                                  builder: (context) => const ViewPhoto(
                                    imageProvider: AssetImage(
                                      AppConstants.DEMOPOST_IMAGE,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Container(
                                color: Colors.white,
                                height: 400,
                                width: double.maxFinite,
                                child: Image.asset(
                                  "provider.getNewsFeedData[index].posts!.last",
                                  fit: BoxFit.cover,
                                ),
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
                                      radius: 20,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      provider.getNewsFeedData[index].posts!
                                          .first.title!,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    const LikeButton(
                                      likeCount: 45,
                                      size: 24,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                const Text(
                                  "Top 7 Best Automatic Subtitle Generators",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "Learn how to rank your e-commerce website on Google",
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
                  );
                }),
              );
            }),
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
      body: Consumer<HomeProvider>(builder: (context, provider, __) {
        return Column(
          children: [
            _storyWidget(),
            _suggestions(),
            // newsFeed(),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.getNewsFeedData.length,
                    itemBuilder: (context, index) {
                      final postlist = provider.getNewsFeedData[index];
                      return FadeAnimation(
                          child: NewsFeed(
                        getNewsFeedModel: postlist,
                      ));
                    }),
              ),
            )
          ],
        );
      }),
    );
  }
}
