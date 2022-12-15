import 'package:animation_wrappers/animations/fade_animation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/home_provider.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:provider/provider.dart';

import '../../themes/color_theme.dart';

class SuggestedVideo extends StatefulWidget {
  const SuggestedVideo({super.key});

  @override
  State<SuggestedVideo> createState() => _SuggestedVideoState();
}

class _SuggestedVideoState extends State<SuggestedVideo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeAnimation(
              child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Suggested for you",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          )),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: Consumer<HomeProvider>(builder: (context, provider, __) {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.suggestedVideoList.length,
                  itemBuilder: (context, index) {
                    final data = provider.suggestedVideoList[index];
                    return FadeAnimation(
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${AppConstants.BASE_URL}/upload/ChapterPic/${data.objImage}",
                                      placeholder: (context, url) =>
                                          Image.asset(
                                              AppConstants.PLACEHOLDER_IMAGE),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              AppConstants.PLACEHOLDER_IMAGE),
                                    ),
                                  ),
                                  title: Text(
                                    data.name ?? "".toUpperCase(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    data.description ?? "",
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 15,
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
                    );
                  });
            }),
          ),
        ],
      ),
    );
  }
}
