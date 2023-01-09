// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/models/get_test_activity_model.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/views/class_activities/chapter_test/write_test_answers.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:slide_countdown/slide_countdown.dart';
import '../../../themes/color_theme.dart';

class TestActivity extends StatefulWidget {
  const TestActivity({Key? key}) : super(key: key);

  @override
  State<TestActivity> createState() => _TestActivityState();
}

class _TestActivityState extends State<TestActivity>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  // List<Tab> _tabs = [
  //   // Tab(height: 35, text: 'Fill in the blanks'.toUpperCase()),
  //   // Tab(height: 35, text: 'Very short'.toUpperCase()),
  //   // Tab(height: 35, text: 'Short'.toUpperCase()),
  //   // Tab(height: 35, text: 'Short'.toUpperCase()),
  //   // Tab(height: 35, text: 'Short'.toUpperCase()),
  //   // Tab(height: 35, text: 'Short'.toUpperCase()),
  //   // Tab(height: 35, text: 'Long'.toUpperCase()),
  // ];

  @override
  void dispose() {
    // _streamDuration.dispose();
    _tabController!.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() => context
        .read<ClassActivityProvider>()
        .getTest()
        .whenComplete(() => _tabController = TabController(
            length:
                context.read<ClassActivityProvider>().questionTypeList.length,
            vsync: this)));
  }

// Warning when student want to leav the test
  Future<bool> onWillPop() async {
    return await QuickAlert.show(
            showCancelBtn: true,
            barrierDismissible: false,
            cancelBtnText: "Leave test",
            confirmBtnText: "Continue",
            confirmBtnColor: kBlue,
            context: context,
            type: QuickAlertType.warning,
            title: 'Oops..!',
            text:
                'Are you sure you want to leave?\nYou will loose your unsaved answers',
            onCancelBtnTap: () {
              Navigator.of(context, rootNavigator: true).pop(true);
            },
            onConfirmBtnTap: () {
              Navigator.of(context, rootNavigator: true).pop(false);
            }) ??
        false;
  }

  Widget _timerWidget() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SlideCountdown(
          duration:
              context.read<ClassActivityProvider>().streamDuration.duration,
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
            context.read<ClassActivityProvider>().activityTestSubmit();
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
        body: Consumer<ClassActivityProvider>(builder: (context, provider, __) {
          return provider.isLoading
              ? const Loading()
              : _tabController == null
                  ? const SizedBox()
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DecoratedBox(
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
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              controller: _tabController,
                              tabs: provider.tabs,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                              controller: _tabController,
                              children: List.generate(
                                provider.testQuestionList.length,
                                (index) => Questions(
                                  type: provider
                                      .testQuestionList[index].questionType!,
                                  testquestion: provider.testQuestionList,
                                ),
                              )),
                        )
                      ],
                    );
        }),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(16),
          child:
              Consumer<ClassActivityProvider>(builder: (context, provider, __) {
            return CustomButton(
              onPressed: provider.testAnswersSelected !=
                      provider.testQuestionList.length - 1
                  ? null
                  : () {
                      provider.activityTestSubmit();
                    },
              text: "Submit",
            );
          }),
        ),
      ),
    );
  }
}

class Questions extends StatefulWidget {
  final String type;
  final List<Testquestion>? testquestion;
  const Questions({super.key, required this.type, this.testquestion});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  // List<Map<String, dynamic>> testQuestionList = [
  //   {
  //     "question":
  //         "When the clock strikes 6:20, what type of angle is formed between the two hands of the clock?",
  //     "answers": "",
  //     "image": "",
  //     "type": "Fill in the blanks"
  //   },
  //   {
  //     "question":
  //         "What was the big strategy behind Dubai burj khalifa building?",
  //     "answers": "",
  //     "image": "",
  //     "type": "Very short"
  //   },
  //   {
  //     "question":
  //         "What was the big strategy behind Dubai burj khalifa building?",
  //     "answers": "",
  //     "image": "",
  //     "type": "Fill in the blanks"
  //   },
  // ];

  List<String> trueFalseList = ['True', 'False'];

  @override
  Widget build(BuildContext context) {
    return Consumer<ClassActivityProvider>(builder: (context, provider, __) {
      return ListView.builder(
          padding: const EdgeInsets.all(16),
          shrinkWrap: true,
          itemCount: widget.testquestion!.length,
          itemBuilder: (context, i) {
            final testQuestionId = widget.testquestion![i].questionId;
            final isAnswered =
                provider.testAnswers.containsValue(testQuestionId); // false
            // print(provider.testAnswers["testsubmit[${i.toString()}][answer]"]);
            if (widget.testquestion![i].questionType == widget.type) {
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
                      HtmlWidget(
                        widget.testquestion![i].question!,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      widget.testquestion![i].questionType == "TRUE or FALSE"
                          ? Column(
                              children: List.generate(
                                trueFalseList.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    onTap: () {
                                      provider.addTestAnswers(
                                        i,
                                        widget.testquestion![i].testmapId!,
                                        widget.testquestion![i].questionId!,
                                        trueFalseList[index],
                                      );
                                    },
                                    selected: (provider.testAnswers[
                                                    "testsubmit[${i.toString()}][answer]"] ==
                                                "True" &&
                                            index == 0)
                                        ? true
                                        : (provider.testAnswers[
                                                        "testsubmit[${i.toString()}][answer]"] ==
                                                    "False" &&
                                                index == 1)
                                            ? true
                                            : false,
                                    selectedTileColor: kPrimaryColor,
                                    tileColor: kWhite,
                                    selectedColor: kWhite,
                                    title: Text(
                                      trueFalseList[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : CustomButton(
                              backgroundColor: Colors.grey.shade300,
                              foregroundColor: kPrimaryColor,
                              fullWidth: true,
                              onPressed: () {
                                OneContext().push(
                                  MaterialPageRoute(
                                    builder: (_) => WriteTestAnswer(
                                      index: i,
                                      isUpdateAnswer: isAnswered,
                                      initialAnswer: provider.testAnswers[
                                              "testsubmit[${i.toString()}][answer]"] ??
                                          "",
                                      testMapId:
                                          widget.testquestion![i].testmapId!,
                                      questionId:
                                          widget.testquestion![i].questionId!,
                                    ),
                                  ),
                                );
                              },
                              text:
                                  isAnswered ? "Update Answer" : "Write Answer",
                            )
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          });
    });
  }
}
