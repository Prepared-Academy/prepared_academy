import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../services/user_service.dart';
import '../../../utils/app_constants.dart';

class LibraryVideoWebView extends StatefulWidget {
  final String videoUrl;
  final bool isChapterVideo;
  final int? objectiveId;
  final int? objectiveVideoId;
  final String? moduele;
  final String? description;
  const LibraryVideoWebView({
    Key? key,
    required this.videoUrl,
    required this.isChapterVideo,
    this.objectiveId,
    this.objectiveVideoId,
    this.moduele,
    this.description,
  }) : super(key: key);

  @override
  State<LibraryVideoWebView> createState() => _LibraryVideoWebViewState();
}

class _LibraryVideoWebViewState extends State<LibraryVideoWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.description!),
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(
          disableVerticalScroll: true,
          disableHorizontalScroll: true,
          transparentBackground: true,
          useShouldOverrideUrlLoading: true,
          supportZoom: false,
        )),
        initialUrlRequest: URLRequest(
            url: Uri.parse(
                "${AppConstants.BASE_URL}/vimeovideo?webLink=${widget.videoUrl}"),
            headers: {"Authorization": "Bearer ${UserService.token}"}),
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          // var uri = navigationAction.request.url!;

          return NavigationActionPolicy.CANCEL;
        },
      ),
    );
  }
}
