import 'package:flutter/material.dart';

import 'package:html_editor_enhanced/html_editor.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:stream_duration/stream_duration.dart';
import '../../themes/color_theme.dart';

class TestActivity extends StatefulWidget {
  const TestActivity({super.key});

  @override
  State<TestActivity> createState() => _TestActivityState();
}

class _TestActivityState extends State<TestActivity>
    with SingleTickerProviderStateMixin {
  final HtmlEditorController controller = HtmlEditorController();
  final StreamDuration _streamDuration = StreamDuration(
    const Duration(hours: 1, minutes: 30),
  );

  @override
  void dispose() {
    _streamDuration.dispose();

    super.dispose();
  }

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final arguments = (ModalRoute.of(context)?.settings.arguments ??
            <String, dynamic>{}) as Map;
        if (arguments.isNotEmpty) {
          Future.microtask(() =>
              context.read<ClassActivityProvider>().getTest(arguments["id"]));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Test Activity"),
      ),
      body: Consumer<ClassActivityProvider>(builder: (context, provider, __) {
        return Padding(
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
                          Text(
                            provider.questionType.isEmpty
                                ? ""
                                : context
                                    .watch<ClassActivityProvider>()
                                    .questionType[0]
                                    .taxonomyCount
                                    .toString(),
                          ),
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
