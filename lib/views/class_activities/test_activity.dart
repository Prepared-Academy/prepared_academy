import 'package:flutter/material.dart';

import 'package:html_editor_enhanced/html_editor.dart';
import 'package:prepared_academy/models/chapterTest_model.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
// ignore: depend_on_referenced_packages
import 'package:stream_duration/stream_duration.dart';
import '../../themes/color_theme.dart';

class TestActivity extends StatefulWidget {
  const TestActivity({super.key});

  @override
  State<TestActivity> createState() => _TestActivityState();
}

class _TestActivityState extends State<TestActivity>
    with SingleTickerProviderStateMixin {
  int _current = 0;
  final PageController _controller = PageController();
  late TabController _tabController;
  final HtmlEditorController controller = HtmlEditorController();
  int testmapId = -1;
  ChapterTestModel chapterTestModel = ChapterTestModel();
  final StreamDuration _streamDuration = StreamDuration(
    const Duration(hours: 1, minutes: 30),
  );

  @override
  void dispose() {
    _streamDuration.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final arguments = (ModalRoute.of(context)?.settings.arguments ??
            <String, dynamic>{}) as Map;
        if (arguments.isNotEmpty) {
          Future.microtask(() => context
              .read<ClassActivityProvider>()
              .getTestActivity(arguments["testmapId"]));
          setState(() {
            _tabController = TabController(
                length: chapterTestModel.questiontypes!.length, vsync: this);
          });
        }
      },
    );
  }

  void nextPage() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
  }

  void previousPage() {
    _controller.previousPage(
        duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Test Activity"),
      ),
      body: Consumer<ClassActivityProvider>(builder: (context, provider, __) {
        return provider.chapterTestquizList.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SlideCountdown(
                      duration: StreamDuration(
                        const Duration(hours: 1, minutes: 30),
                      ).duration,
                      slideDirection: SlideDirection.down,
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.alarm,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      onDone: () {
                        debugPrint("Done");
                      },
                    ),
                    NestedScrollView(
                        clipBehavior: Clip.none,
                        headerSliverBuilder: (context, innerBoxIsScrolled) {
                          return [
                            SliverToBoxAdapter(
                              child: TabBar(
                                  indicatorColor: kPrimaryColor,
                                  labelStyle: const TextStyle(color: kBlack),
                                  unselectedLabelColor: Colors.grey,
                                  isScrollable: true,
                                  controller: _tabController,
                                  tabs: chapterTestModel.questiontypes!
                                      .map((e) => Tab(
                                            text: '${e.questionType}',
                                          ))
                                      .toList()),
                            )
                          ];
                        },
                        body: const TabBarView(
                          children: [],
                        )),
                    Card(
                      color: Colors.white,
                      elevation: 0,
                      margin: const EdgeInsets.only(bottom: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: kBorder)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Consumer<ClassActivityProvider>(
                          builder: (context, provider, __) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SlideCountdown(
                                //   duration: provider.testQuestion.single.testDuration.
                                //   )
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              );
      }),
    );
  }
}
