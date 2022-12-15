import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/icon_button.dart';
import 'package:prepared_academy/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../../providers/class_activity_provider.dart';

class QuizActivtiy extends StatefulWidget {
  const QuizActivtiy({super.key});

  @override
  State<QuizActivtiy> createState() => _QuizActivtiyState();
}

class _QuizActivtiyState extends State<QuizActivtiy> {
  final PageController _controller = PageController();
  int _current = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(
        () => context.read<ClassActivityProvider>().getChatperModuleQuiz());
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            Consumer<ClassActivityProvider>(builder: (context, provider, __) {
          return provider.isLoading
              ? const Loading()
              : provider.quizActivityList.isEmpty
                  ? const SizedBox()
                  : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            provider.quizActivityList.length,
                            (index) {
                              return Container(
                                width: 12.0,
                                height: 12.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? Colors.white
                                            : kPrimaryColor)
                                        .withOpacity(
                                            _current == index ? 0.9 : 0.4)),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: ExpandablePageView.builder(
                              controller: _controller,
                              onPageChanged: (index) {
                                setState(() => _current = index);
                              },
                              itemCount: provider.quizActivityList.length,
                              itemBuilder: (BuildContext context, int index) {
                                final quiz = provider.quizActivityList[index];
                                return Card(
                                  color: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(color: kBorder)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        HtmlWidget(
                                          quiz.question!.replaceAll("<img",
                                              "<img width='90' height='90'"),
                                        ),
                                        const SizedBox(height: 20),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: quiz.options!.length,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder:
                                                (context, optionsIndex) {
                                              final quizOptions =
                                                  quiz.options![optionsIndex];
                                              final isSelected = provider
                                                  .quizAnswers
                                                  .containsValue(quizOptions
                                                      .optionsId); // false

                                              return quizOptions.options == "_"
                                                  ? const SizedBox()
                                                  : Card(
                                                      color: Colors.white,
                                                      elevation: 0,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 10),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          side:
                                                              const BorderSide(
                                                                  color:
                                                                      kBorder)),
                                                      child: ListTile(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                        onTap: () {
                                                          provider
                                                              .addQuizAnswer(
                                                            index,
                                                            quiz.quizmapId!,
                                                            quizOptions
                                                                .questionId!,
                                                            quizOptions
                                                                .optionsId!,
                                                          );
                                                        },
                                                        selected: isSelected,
                                                        selectedTileColor:
                                                            kPrimaryColor,
                                                        tileColor: kWhite,
                                                        selectedColor: kWhite,
                                                        title: Text(
                                                          quizOptions.options!,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                            }),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: CustomIconButton(
                                  iconData: Icons.arrow_back_ios_new_rounded,
                                  onTap: () => previousPage()),
                            ),
                            const SizedBox(width: 20),
                            CustomButton(
                                onPressed: provider.quizAnswersSelected !=
                                        provider.quizActivityList.length - 1
                                    ? null
                                    : () {
                                        provider.activityVideoQuizSubmit();
                                      },
                                text: "Submit"),
                            const SizedBox(width: 20),
                            Flexible(
                              child: CustomIconButton(
                                iconData: Icons.arrow_forward_ios_rounded,
                                onTap: () => nextPage(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
        }),
      ),
    );
  }
}
