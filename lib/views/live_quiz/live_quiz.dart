// import 'dart:collection';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:prepared_academy/services/user_service.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../utils/app_constants.dart';

// class LiveQuiz extends StatefulWidget {
//   const LiveQuiz({super.key});

//   @override
//   State<LiveQuiz> createState() => _LiveQuizState();
// }

// class _LiveQuizState extends State<LiveQuiz> {
//   final GlobalKey webViewKey = GlobalKey();

//   InAppWebViewController? webViewController;

//   PullToRefreshController? pullToRefreshController;

//   String url = "";
//   double progress = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Stack(
//         children: [
//           InAppWebView(
//             initialOptions: InAppWebViewGroupOptions(
//                 crossPlatform: InAppWebViewOptions(
//               supportZoom: false,
//             )),
//             key: webViewKey,
//             initialUrlRequest: URLRequest(
//                 url: Uri.parse('${AppConstants.BASE_URL}/playlivequiz'),
//                 headers: {"Authorization": "Bearer ${UserService.token}"}),

//             initialUserScripts: UnmodifiableListView<UserScript>([]),
//             pullToRefreshController: pullToRefreshController,
//             onWebViewCreated: (controller) async {
//               webViewController = controller;
//             },
//             onLoadStart: (controller, url) async {
//               setState(() {
//                 this.url = url.toString();
//               });
//             },

//             shouldOverrideUrlLoading: (controller, navigationAction) async {
//               var uri = navigationAction.request.url!;

//               if (![
//                 "http",
//                 "https",
//                 "file",
//                 "chrome",
//                 "data",
//                 "javascript",
//                 "about"
//               ].contains(uri.scheme)) {
//                 if (await canLaunchUrl(uri)) {
//                   // Launch the App
//                   await launchUrl(
//                     uri,
//                   );
//                   // and cancel the request
//                   return NavigationActionPolicy.CANCEL;
//                 }
//               }

//               return NavigationActionPolicy.ALLOW;
//             },
//             onLoadStop: (controller, url) async {
//               pullToRefreshController?.endRefreshing();
//               setState(() {
//                 this.url = url.toString();
//               });
//             },
//             // onReceivedError: (controller, request, error) {
//             //   pullToRefreshController?.endRefreshing();
//             // },
//             onProgressChanged: (controller, progress) {
//               if (progress == 100) {
//                 pullToRefreshController?.endRefreshing();
//               }
//               setState(() {
//                 this.progress = progress / 100;
//               });
//             },
//             onUpdateVisitedHistory: (controller, url, isReload) {
//               setState(() {
//                 this.url = url.toString();
//               });
//             },
//             onConsoleMessage: (controller, consoleMessage) {
//               // print(consoleMessage);
//             },
//           ),
//           progress < 1.0
//               ? LinearProgressIndicator(value: progress)
//               : Container(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:prepared_academy/providers/live_quiz_provider.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:provider/provider.dart';

import '../../themes/color_theme.dart';

class LiveQuiz extends StatefulWidget {
  const LiveQuiz({super.key});

  @override
  State<LiveQuiz> createState() => _LiveQuizState();
}

class _LiveQuizState extends State<LiveQuiz> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => context.read<LiveQuizProvider>().init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Live Quizes")),
      body: Consumer<LiveQuizProvider>(builder: (context, provider, __) {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: provider.liveQuizesList.length,
          itemBuilder: (context, index) {
            final data = provider.liveQuizesList[index];
            return SizedBox(
              height: 230,
              child: Card(
                color: Colors.white,
                elevation: 0,
                margin: const EdgeInsets.only(bottom: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: kBorder)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text(
                        "${data.quizname!}sadlk asljd lasj dkjasdkljsakdljaskd",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      )),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(data.subjectName!),
                          Text(data.mentorName!),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      const Text("Instructions:\n1.Play and have fun"),
                      const Spacer(),
                      const Divider(),
                      MiniElevatedButton(
                        fullWidth: true,
                        onPressed: () {},
                        text: "Launch Quiz",
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
