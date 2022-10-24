import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:prepared_academy/components/change_image.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/widgets/buttons.dart';

class WriteAnswer extends StatefulWidget {
  const WriteAnswer({super.key});

  @override
  State<WriteAnswer> createState() => _WriteAnswerState();
}

class _WriteAnswerState extends State<WriteAnswer> {
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
                htmlEditorOptions: const HtmlEditorOptions(
                  hint: 'Your answer here...',
                  shouldEnsureVisible: true,

                  //initialText: "<p>text content initial, if any</p>",
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    GFButton(
                      highlightElevation: 0,
                      color: kPrimaryColor,
                      onPressed: () async {
                        await changeImage(true);
                      },
                      text: "Add image",
                      icon: const Icon(
                        Icons.image,
                        color: kPrimaryColor,
                      ),
                      type: GFButtonType.outline,
                    ),
                    const Spacer(),
                    CustomButton(
                        onPressed: () async {
                          var txt = await controller.getText();
                          if (txt.contains('src="data:')) {
                            txt =
                                '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                          }
                          setState(() {
                            result = txt;
                          });
                        },
                        text: "SUBMIT"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
