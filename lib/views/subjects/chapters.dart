import 'package:animation_wrappers/animations/fade_animation.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/widgets.dart';

import '../../animation/animation_list.dart';
import '../../themes/color_theme.dart';
import '../../widgets/circle.dart';

class Chapters extends StatefulWidget {
  const Chapters({super.key});

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  final ScrollController _scrollController = ScrollController();
  bool textShow = false;
  static const kExpandedHeight = 200.0;
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        textShow = _isSliverAppBarExpanded ? true : false;
      });
    });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - (kExpandedHeight / 2);
  }

  Widget _suggestions() => Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FadeAnimation(
            child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Suggested for you"),
        )),
        const SizedBox(height: 10),
        Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.4,
                  0.9,
                ],
                colors: [
                  Colors.red.shade900,
                  Colors.red.shade900.withOpacity(0.4)
                ],
              )),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: Card(
                color: kPrimaryColor.withOpacity(0.4),
                elevation: 0,
                margin: EdgeInsets.zero,
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
                    title: const Text(
                      "Understanding Elementary Shapes",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: kWhite),
                    ),
                    subtitle: const Text(
                      "7 Modules",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        color: kWhite,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: kWhite,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ]));

  Widget _chapterList() => Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        FadeAnimation(
            child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("All Chapters"),
        )),
        // const SizedBox(height: 10),
        LiveList(
          delay: animationDurationList,
          shrinkWrap: true,
          itemCount: 3,
          controller: scrollController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index, animation) {
            return AnimationFadeList(
              animation: animation,
              widget: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 150,
                    margin:
                        const EdgeInsets.only(bottom: 30, left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: kBorder),
                        borderRadius: BorderRadius.circular(15)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {},
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.2),
                                    BlendMode.darken),
                                child: Image.asset(
                                  AppConstants.DEMOPOST_IMAGE,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 24, left: 16, right: 16, bottom: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Top 7 Best Automatic Subtitle Generators For Future Metaverse"
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "Objective: 7",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Buttonicon(
                                        backgroundColor: index == 1
                                            ? Colors.blue.shade800
                                            : kPrimaryColor,
                                        fullWidth: true,
                                        onPressed: () {},
                                        text: index != 1 ? "START" : "Continue")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: -25,
                      right: 5,
                      child: ProgressCircle(
                          total: 100, current: index == 1 ? 60 : 0)),
                ],
              ),
            );
          }),
        ),
      ]));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
              expandedHeight: kExpandedHeight,
              pinned: true,
              elevation: 0,
              leadingWidth: 55,
              title: _isSliverAppBarExpanded == false
                  ? const SizedBox()
                  : const Text("Compiler Design"),
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: FloatingActionButton.small(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  onPressed: () {},
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  AppConstants.CHAPTERSBACK1_IMAGE,
                  fit: BoxFit.cover,
                ),
                titlePadding: const EdgeInsets.all(16),
                expandedTitleScale: 1,
                centerTitle: false,
                title: _isSliverAppBarExpanded != false
                    ? const SizedBox()
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Compiler Design",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: const [
                              ChaptersDataCount(text: "Chapters", count: "7")
                            ],
                          )
                        ],
                      ),
              )),
          SliverToBoxAdapter(child: _suggestions()),
          SliverToBoxAdapter(child: _chapterList())
        ],
      ),
    );
  }
}
