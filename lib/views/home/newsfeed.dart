// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

import 'package:like_button/like_button.dart';
import 'package:one_context/one_context.dart';

import 'package:prepared_academy/models/get_newsfeed_model.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/widgets/photo_view.dart';

import '../../animation/animation_list.dart';

class NewsFeed extends StatelessWidget {
  final scrollController = ScrollController();
  final GetNewsFeedModel getNewsFeedModel;
  NewsFeed({
    Key? key,
    required this.getNewsFeedModel,
  }) : super(key: key);

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
                            "Since we dsdstart, our keywords are much more targeted and we are seeing much more traffic and activity.",
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(child: const Text("Newsfeed")),
          newsPost(getNewsFeedModel.posts!),
        ],
      ),
    );
  }
}
