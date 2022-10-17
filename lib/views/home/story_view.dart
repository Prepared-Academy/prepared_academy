// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/home_provider.dart';
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
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          // print("pageIndex $pageIndex");
          // print("StoryIndex $storyIndex");
          context.read<HomeProvider>().storyUsers =
              context.read<HomeProvider>().story[pageIndex];
          context.read<HomeProvider>().fact =
              context.read<HomeProvider>().storyUsers.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.network(
                  "https://images.unsplash.com/photo-1665875807836-f8978a048aa6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80",
                  fit: BoxFit.cover,
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
                          image: AssetImage(
                              context.read<HomeProvider>().storyUsers.imageUrl),
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
                          context.read<HomeProvider>().storyUsers.userName,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          context.read<HomeProvider>().fact.title!,
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
                        context.read<HomeProvider>().fact.bookmarkStatus == 0
                            ? false
                            : true, onPressed: () {
                      if (context.read<HomeProvider>().fact.bookmarkStatus ==
                          0) {
                        context.read<HomeProvider>().addStoryBookMark(
                            context.read<HomeProvider>().fact.id!,
                            context.read<HomeProvider>().fact.typeId!);
                      } else {
                        context.read<HomeProvider>().removeBookmarkStory(
                              context.read<HomeProvider>().fact.bookmarkId!,
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
        pageLength: context.read<HomeProvider>().story.length,
        storyLength: (int pageIndex) {
          return context.read<HomeProvider>().story[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
