// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:provider/provider.dart';

class WriteTestAnswer extends StatefulWidget {
  final int index;
  final bool isUpdateAnswer;
  final String initialAnswer;
  final int testMapId;
  final int questionId;
  const WriteTestAnswer({
    super.key,
    required this.index,
    required this.isUpdateAnswer,
    required this.initialAnswer,
    required this.testMapId,
    required this.questionId,
  });

  @override
  State<WriteTestAnswer> createState() => _WriteTestAnswerState();
}

class _WriteTestAnswerState extends State<WriteTestAnswer> {
  String result = '';
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Answer"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'Your answer here...',
                  shouldEnsureVisible: true,
                  initialText:
                      widget.isUpdateAnswer ? widget.initialAnswer : null,
                ),
                htmlToolbarOptions: const HtmlToolbarOptions(
                  defaultToolbarButtons: [
                    StyleButtons(),
                    FontSettingButtons(fontSizeUnit: false),
                    FontButtons(
                      clearAll: false,
                      superscript: false,
                      subscript: false,
                    ),
                    ColorButtons(),
                    ListButtons(listStyles: false),
                    ParagraphButtons(
                        textDirection: false,
                        lineHeight: false,
                        caseConverter: false),
                    InsertButtons(
                        video: false,
                        audio: false,
                        table: false,
                        hr: false,
                        picture: false)
                  ],
                  renderBorder: true,
                  toolbarPosition: ToolbarPosition.aboveEditor,
                  toolbarType: ToolbarType.nativeScrollable,
                ),
                otherOptions: const OtherOptions(height: 400),
              ),
              const SizedBox(height: 10),
              Center(
                child: CustomButton(
                    onPressed: () async {
                      var txt = await controller.getText();

                      await context
                          .read<ClassActivityProvider>()
                          .addTestAnswers(
                            widget.index,
                            widget.testMapId,
                            widget.questionId,
                            txt,
                          );

                      OneContext().pop();

                      // if (txt.contains('src="data:')) {
                      //   txt =
                      //       '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                      // }
                      // setState(() {
                      //   result = txt;
                      // });
                    },
                    text: "SUBMIT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
