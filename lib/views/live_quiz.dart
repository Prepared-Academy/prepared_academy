import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:prepared_academy/providers/live_quiz_provider.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

class LiveQuiz extends StatefulWidget {
  const LiveQuiz({super.key});

  @override
  State<LiveQuiz> createState() => _LiveQuizState();
}

class _LiveQuizState extends State<LiveQuiz> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<LiveQuizProvider>().initToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          InAppWebView(
            initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
              supportZoom: false,
            )),
            key: webViewKey,
            initialUrlRequest: URLRequest(
                url: Uri.parse('https://preparedacademy.com/playlivequiz'
                    // '${AppConstants.BASE_URL}/playlivequiz',
                    ),
                headers: {
                  "Authorization":
                      // "Bearer ${context.read<LiveQuizProvider>().token}"
                      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMTRhNjFjMjdhNTcyZGY1NmQzMzU1NWVkODAyM2UyMjMyMWQyNzc1NTI0ZmY2NWQ0MWZiZWMwZTZjOTMzNTA3ZjY1ZTRhYzBhZmM5NGUzZmEiLCJpYXQiOjE2NzEwOTc3MjcsIm5iZiI6MTY3MTA5NzcyNywiZXhwIjoxNzAyNjMzNzI2LCJzdWIiOiIyODg2Iiwic2NvcGVzIjpbXX0.E9SaAgD6q225Ha-0YBzg2kbwNXER0vfTcMoIDWCyq9Fz93G_w1tS2uxcTYuecqrDZssA_8GWx5pgkLk0Kj_NADYfJNrquFCpp-cayZgv4IhwOc1AYX6EHc1cfbtXiw2SENTzELYPbTsCOO-G0vfTphubRAX9C2gDnw0kSY-fsE119YSBLCgTCg8qj5cl2zMnn9_GhynkdFs_FUYFaa2rbgnof89psSBSaySSBonTeht0ncwR2f5zLIGmOLhjc1gCTuabKj_c73WocnCx03dT7UVra25Rm9B4j0sKDWeo0QExOAvgeekotWf0ovPstyOdw-xq8n7efoWC23QlXFiKZ7L_8qT4lMJrhipwuzuFUiHmFMBLSqWx0aT2whDYr1gCYdZFl9Dsg3uBcDi7mvdE1chgNcqxmlNAf61qP42uMq7Ll-hgt3BSNmFWS7IBPa60UJrrXKOAyOMjGX3eBUt-wpC_ym_ylr-KwldjInpPgKcAWy06N3nhX3SMLrz2rfC5gCW2QaYx48KDPcEWE9SnktALXOplStDgWKhhLl227kelbWccycu-CXEJCXKRDMFnsoNPVBbRt81EmvmLJimef1rCEKgs9gPhxT6BrWizi0fr9ASonjTFiKBsiyrshFtz4lTB-MjCreJkQvGCq1MzGEwKNhRuuQ_D97gLX3sqcEE"
                }),
            // initialUrlRequest:
            // URLRequest(url: WebUri(Uri.base.toString().replaceFirst("/#/", "/") + 'page.html')),
            // initialFile: "assets/index.html",
            initialUserScripts: UnmodifiableListView<UserScript>([]),
            // initialSettings: settings,
            // contextMenu: contextMenu,

            pullToRefreshController: pullToRefreshController,
            onWebViewCreated: (controller) async {
              webViewController = controller;
              // print(await controller.getUrl());
            },
            onLoadStart: (controller, url) async {
              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });
            },
            // onPermissionRequest: (controller, request) async {
            //   return PermissionResponse(
            //       resources: request.resources,
            //       action: PermissionResponseAction.GRANT);
            // },
            shouldOverrideUrlLoading: (controller, navigationAction) async {
              var uri = navigationAction.request.url!;

              if (![
                "http",
                "https",
                "file",
                "chrome",
                "data",
                "javascript",
                "about"
              ].contains(uri.scheme)) {
                if (await canLaunchUrl(uri)) {
                  // Launch the App
                  await launchUrl(
                    uri,
                  );
                  // and cancel the request
                  return NavigationActionPolicy.CANCEL;
                }
              }

              return NavigationActionPolicy.ALLOW;
            },
            onLoadStop: (controller, url) async {
              pullToRefreshController?.endRefreshing();
              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });
            },
            // onReceivedError: (controller, request, error) {
            //   pullToRefreshController?.endRefreshing();
            // },
            onProgressChanged: (controller, progress) {
              if (progress == 100) {
                pullToRefreshController?.endRefreshing();
              }
              setState(() {
                this.progress = progress / 100;
                urlController.text = url;
              });
            },
            onUpdateVisitedHistory: (controller, url, isReload) {
              setState(() {
                this.url = url.toString();
                urlController.text = this.url;
              });
            },
            onConsoleMessage: (controller, consoleMessage) {
              // print(consoleMessage);
            },
          ),
          progress < 1.0
              ? LinearProgressIndicator(value: progress)
              : Container(),
        ],
      ),
    );
  }
}
