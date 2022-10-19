// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/home_provider.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:story/story_page_view/story_page_view.dart';

import '../../widgets/bookmark_button.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  @override
  void initState() {
    super.initState();

    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (context, provider, __) {
        return StoryPageView(
          itemBuilder: (context, pageIndex, storyIndex) {
            provider.storyUsers = provider.story[pageIndex];
            provider.fact = provider.storyUsers.stories[storyIndex];
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(color: Colors.black),
                ),
                Positioned.fill(
                  child: Image.network(
                    "${AppConstants.BASE_URL}/upload/DailyFacts/${provider.fact.content}",
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 44, left: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(context
                                .read<HomeProvider>()
                                .storyUsers
                                .imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            provider.storyUsers.userName,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            provider.fact.title!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          gestureItemBuilder: (context, pageIndex, storyIndex) {
            return Stack(children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BookMarkButton(
                          provider.fact.bookmarkStatus == 0 ? false : true,
                          onPressed: () {
                        if (context.read<HomeProvider>().fact.bookmarkStatus ==
                            0) {
                          provider.addStoryBookMark(
                              provider.fact.id!, provider.fact.typeId!);
                        } else {
                          provider.removeBookmarkStory(
                            provider.fact.bookmarkId!,
                          );
                        }
                      }),
                      IconButton(
                        padding: EdgeInsets.zero,
                        color: Colors.white,
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]);
          },
          indicatorAnimationController: indicatorAnimationController,
          initialStoryIndex: (pageIndex) {
            // if (pageIndex == 0) {
            //   return 1;
            // }
            return 0;
          },
          pageLength: provider.story.length,
          storyLength: (int pageIndex) {
            return provider.story[pageIndex].stories.length;
          },
          onPageLimitReached: () {
            Navigator.pop(context);
          },
        );
      }),
    );
  }
}
