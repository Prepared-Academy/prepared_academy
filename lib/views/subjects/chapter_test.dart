// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:stream_duration/stream_duration.dart';

import '../../themes/color_theme.dart';

class ChapterTest extends StatefulWidget {
  const ChapterTest({Key? key}) : super(key: key);

  @override
  State<ChapterTest> createState() => _ChapterTestState();
}

class _ChapterTestState extends State<ChapterTest>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final StreamDuration _streamDuration = StreamDuration(
    const Duration(hours: 1, minutes: 30),
  );
  final _tabs = [
    Tab(height: 35, text: 'Fill in the blanks'.toUpperCase()),
    Tab(height: 35, text: 'Very short'.toUpperCase()),
    Tab(height: 35, text: 'Short'.toUpperCase()),
    Tab(height: 35, text: 'Long'.toUpperCase()),
  ];

  @override
  void dispose() {
    _streamDuration.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

// Warning when student want to leav the test
  Future<bool> onWillPop() async {
    return await QuickAlert.show(
            showCancelBtn: true,
            barrierDismissible: false,
            cancelBtnText: "Leave test",
            confirmBtnText: "Continue",
            context: context,
            type: QuickAlertType.warning,
            title: 'Oops..!',
            text:
                'Are you sure you want to leave?\nYou will loose your unsaved answers',
            onCancelBtnTap: () {
              // Navigator.pop(context, true);

              Navigator.of(context, rootNavigator: true).pop(true);
            },
            onConfirmBtnTap: () {
              Navigator.of(context, rootNavigator: true).pop(false);
              // Navigator.pop(context, false);
            }) ??
        false;
  }

  Widget _timerWidget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SlideCountdown(
          duration: _streamDuration.duration,
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
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
          actions: [_timerWidget()],
        ),
        body: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.2),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kPrimaryColor,
                ),
                splashBorderRadius: BorderRadius.circular(10),
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.white,
                labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                controller: _tabController,
                tabs: _tabs,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Questions(type: "Fill in the blanks"),
                  Questions(type: "Very short"),
                  Questions(type: "Short"),
                  Questions(type: "Long"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Questions extends StatefulWidget {
  final String type;
  const Questions({super.key, required this.type});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  List<Map<String, dynamic>> testQuestionList = [
    {
      "question":
          "When the clock strikes 6:20, what type of angle is formed between the two hands of the clock?",
      "answers": "",
      "image": "",
      "type": "Fill in the blanks"
    },
    {
      "question":
          "What was the big strategy behind Dubai burj khalifa building?",
      "answers": "",
      "image": "",
      "type": "Very short"
    },
    {
      "question":
          "What was the big strategy behind Dubai burj khalifa building?",
      "answers": "",
      "image": "",
      "type": "Fill in the blanks"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: testQuestionList.length,
        itemBuilder: (context, i) {
          if (testQuestionList[i]["type"] == widget.type) {
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  border: Border.all(color: kBorder),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Question ${i + 1}"),
                    const SizedBox(height: 5),
                    Text(
                      testQuestionList[i]["question"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: kPrimaryColor,
                      fullWidth: true,
                      onPressed: () {
                        // TODO write answers!!!
                        // setState(() {
                        //   testQuestionList.indexWhere((element) => element[]);
                        // });

                        OneContext().pushNamed(AppRoutes.WRITEANSWER);
                      },
                      text: "Write Answer",
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }
}
