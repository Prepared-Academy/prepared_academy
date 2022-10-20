// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:prepared_academy/utils/validator.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../providers/class_activity_provider.dart';
import '../../themes/color_theme.dart';

class AssignmentActivity extends StatefulWidget {
  const AssignmentActivity({super.key});

  @override
  State<AssignmentActivity> createState() => _AssignmentActivityState();
}

class _AssignmentActivityState extends State<AssignmentActivity> {
  final HtmlEditorController controller = HtmlEditorController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final arguments = (ModalRoute.of(context)?.settings.arguments ??
          <String, dynamic>{}) as Map;
      if (arguments.isNotEmpty) {
        Future.microtask(() => context
            .read<ClassActivityProvider>()
            .getAssignment(arguments["id"]));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Assignment activity"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
                      builder: (context, povider, __) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          povider.studentsAssignmentActivity.isEmpty
                              ? ""
                              : context
                                  .watch<ClassActivityProvider>()
                                  .studentsAssignmentActivity[0]
                                  .title!
                                  .capitalize(),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 5,
                              backgroundColor: kBlue,
                            ),
                            Flexible(
                              child: Html(
                                shrinkWrap: true,
                                data: povider.studentsAssignmentActivity.isEmpty
                                    ? ""
                                    : context
                                        .watch<ClassActivityProvider>()
                                        .studentsAssignmentActivity[0]
                                        .question!,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                )),

            // Editor
            SizedBox(
              height: 300,
              child: HtmlEditor(
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
                // otherOptions: const OtherOptions(height: 400),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
                fullWidth: true,
                onPressed: () async {
                  var txt = await controller.getText();

                  if (txt.isNotEmpty) {
                    context
                        .read<ClassActivityProvider>()
                        .activityAssignmentSubmit(
                          context,
                          context
                              .read<ClassActivityProvider>()
                              .studentsAssignmentActivity[0]
                              .id!,
                          txt,
                        );
                  }
                },
                text: "Submit")
          ],
        ),
      ),
    );
  }
}
