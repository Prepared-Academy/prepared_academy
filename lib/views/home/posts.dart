import 'package:animation_wrappers/animations/fade_animation.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../animation/animation_list.dart';
import '../../themes/color_theme.dart';
import '../../utils/app_constants.dart';
import '../../utils/helper.dart';
import '../../widgets/photo_view.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(
              child: const Text(
            "Newsfeed",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          )),
          Consumer<HomeProvider>(builder: (context, provider, __) {
            return LiveList(
              delay: animationDurationList,
              shrinkWrap: true,
              itemCount: provider.postsList.length,
              controller: scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index, animation) {
                final data = provider.postsList[index];
                return AnimationFadeList(
                  animation: animation,
                  widget: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(color: kBorder),
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "${AppConstants.BASE_URL}/upload/userProfile/${data.profileImage}",
                              errorWidget: (context, url, error) =>
                                  const CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage(AppConstants.PLACEHOLDER_IMAGE),
                              ),
                              placeholder: (context, url) => CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                radius: 30,
                                backgroundImage: const AssetImage(
                                    AppConstants.PLACEHOLDER_IMAGE),
                              ),
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                radius: 30,
                                backgroundImage: imageProvider,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.userName ?? "",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  returnTimeAgo(data.createdAt!),
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            OneContext().push(
                              MaterialPageRoute(
                                builder: (context) => ViewPhoto(
                                  imageProvider: NetworkImage(
                                    "${AppConstants.BASE_URL}/upload/Post/${data.attachment1}",
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppConstants.BASE_URL}/upload/Post/${data.attachment1}",
                                errorWidget: (context, url, error) =>
                                    Image.asset(AppConstants.PLACEHOLDER_IMAGE),
                                placeholder: (context, url) =>
                                    Image.asset(AppConstants.PLACEHOLDER_IMAGE),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        LikeButton(
                          likeCountAnimationType: LikeCountAnimationType.all,
                          likeCountAnimationDuration:
                              const Duration(milliseconds: 0),
                          likeCountPadding: const EdgeInsets.only(left: 10.0),
                          mainAxisAlignment: MainAxisAlignment.start,
                          size: 24,
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              isLiked
                                  ? Icons.favorite
                                  : Icons.favorite_outline_sharp,
                              color: kPrimaryColor,
                            );
                          },
                          isLiked: data.likeStatus == 1 ? true : false,
                          likeCount: data.likes,
                          countBuilder:
                              (int? count, bool isLiked, String text) {
                            var color = kBlack;
                            Widget result;
                            if (count == 0) {
                              result = Text(
                                "",
                                style: TextStyle(color: color),
                              );
                            } else {
                              result = Text(
                                "$text likes",
                                style: TextStyle(color: color, fontSize: 12),
                              );
                            }
                            return result;
                          },
                          onTap: (value) {
                            return provider.onLikeButtonTapped(value, data.id!);
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Text(
                              data.title ?? "",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // const SizedBox(height: 2),
                            // Text(
                            //   data.subtitle ?? "",
                            //   style: const TextStyle(
                            //     fontSize: 12,
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            // ),
                            const SizedBox(height: 10),
                            Text(
                              data.description ?? "",
                              style: const TextStyle(fontSize: 14),
                            )
                          ],
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
  }
}
