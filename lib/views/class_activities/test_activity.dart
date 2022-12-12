import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:html_editor_enhanced/html_editor.dart';
import 'package:prepared_academy/models/chapter_test_model.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/repository/class_acitvity_repo.dart';
import 'package:prepared_academy/utils/app_constants.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:stream_duration/stream_duration.dart';
import '../../themes/color_theme.dart';
import '../../widgets/buttons.dart';
import '../../widgets/input_decoration.dart';

class TestActivity extends StatefulWidget {
  const TestActivity({super.key});

  @override
  State<TestActivity> createState() => _TestActivityState();
}

class _TestActivityState extends State<TestActivity>
    with TickerProviderStateMixin {
  // Initialization

  final ClassActivityRepo classActivityRepo = ClassActivityRepo();
  List<ChapterTestModel> chapterTestquizList = [];
  final PageController _controller = PageController();
  late TabController _tabController;
  final _schoolController = TextEditingController();
  final HtmlEditorController controller = HtmlEditorController();
  int testmapId = -1;
  ChapterTestModel chapterTestModel = ChapterTestModel();
  final StreamDuration _streamDuration = StreamDuration(
    const Duration(hours: 1, minutes: 30),
  );

  // Functions

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      if (arguments.isNotEmpty) {
        Future.microtask(
            () => context.read<ClassActivityProvider>().getTestActivity(67));

        // arguments["id"]
      }
    });
    // _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _streamDuration.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void nextPage() {
    _controller.nextPage(
        duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
  }

  void previousPage() {
    _controller.previousPage(
        duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
  }

  // ignore: unused_element
  Widget _schoolSelectionField() => DropdownSearch<String>(
        dropdownButtonProps: const DropdownButtonProps(
          padding: EdgeInsets.all(0),
          icon: Icon(Icons.arrow_drop_down, color: kPrimaryColor),
        ),
        popupProps: const PopupProps.menu(
          showSearchBox: true,
          showSelectedItems: true,
        ),
        items: AppConstants.schoolList,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: inputDecoration(labelText: "School"),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "required";
          }
          return null;
        },
        onChanged: ((value) {
          _schoolController.text = value ?? "";
        }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Test Activity"),
      ),
      body: Consumer<ClassActivityProvider>(builder: (context, provider, __) {
        return
            // provider.chapterTestquizList.isEmpty
            //     ? const SizedBox()
            //     :
            Column(
          children: [
            TabBar(
              indicatorColor: kPrimaryColor,
              labelColor: kPrimaryColor,
              labelStyle: const TextStyle(color: kBlack),
              unselectedLabelColor: Colors.black38,
              isScrollable: true,
              controller: TabController(
                  length: provider.chapterTestquizList.questiontypes!.length,
                  vsync: this),
              tabs: provider.chapterTestquizList.questiontypes!
                  .map((e) => Tab(text: e.questionType))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: TabController(
                    length: provider.chapterTestquizList.testquestion!.length,
                    vsync: this),
                children:
                    // provider.chapterTestquizList.testquestion!
                    //     .map<Widget>((e) =>
                    //         // e.questionType!.isEmpty
                    //         //     ? SizedBox()
                    //         //     :
                    //         ListView.builder(
                    //             shrinkWrap: false,
                    //             itemBuilder: ((context, index) => Container(
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(8.0),
                    //                   ),
                    //                   child: Questions(
                    //                     testquestion: provider
                    //                         .chapterTestquizList.testquestion!,
                    //                     type: "MCQ",
                    //                     questiontype: provider
                    //                         .chapterTestquizList.questiontypes!,
                    //                   ),
                    //                 ))))
                    //     .toList(),
                    <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child:
                        // const Sequences(),
                        Questions(
                            testquestion:
                                provider.chapterTestquizList.testquestion!,
                            type: "MCQ",
                            questiontype:
                                provider.chapterTestquizList.questiontypes!),
                  ),

                  //   const Text(
                  //     'data',
                  //     style: TextStyle(fontSize: 50),
                  //   ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     color: Colors.orangeAccent,
                  //   ),
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.0),
                  //     color: Colors.greenAccent,
                  //   ),
                  // ),
                  //   Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       color: Colors.greenAccent,
                  //     ),
                  //   ),
                ],
              ),
            ),
            // Card(
            //   color: Colors.white,
            //   elevation: 0,
            //   margin: const EdgeInsets.only(bottom: 10),
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //       side: const BorderSide(color: kBorder)),
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: Consumer<ClassActivityProvider>(
            //       builder: (context, provider, __) {
            //         return Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: const [
            //             // SlideCountdown(
            //             //   duration: provider.testQuestion.single.testDuration.
            //             //   )
            //           ],
            //         );
            //       },
            //     ),
            //   ),
            // ),
            CustomButton(onPressed: () {}, text: "Submit"),
          ],
        );
      }),
    );
  }
}

class Questions extends StatelessWidget {
  final List<Testquestion> testquestion;
  final String type;
  final List<Questiontype> questiontype;

  const Questions(
      {super.key,
      required this.testquestion,
      required this.type,
      required this.questiontype});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: questiontype.length,
        itemBuilder: (context, index) {
          final questions = testquestion[index];

          if (questions.questionType == type) {
            return HtmlWidget(questions.question!
                .replaceAll("(?s)<(\\w+)\\b[^<>]*>.*?</\\1>", ""));
          } else {
            return const SizedBox();
          }
        });
  }
}

// class Sequences extends StatelessWidget {
//   const Sequences({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ClassActivityProvider>(builder: ((context, provider, child) 
//     {
//       return ListView.builder(
//         itemBuilder: (context,index) {
//           if(provider.chapterTestquizList.questiontypes![index].sequence == provider.chapterTestquizList.testquestion![index].sequence) {
//             return HtmlWidget(provider.chapterTestquizList.testquestion[index].question!.replaceAll("(?s)<(\\w+)\\b[^<>]*>.*?</\\1>", ""))
//         }))
//     } ))) 
// }