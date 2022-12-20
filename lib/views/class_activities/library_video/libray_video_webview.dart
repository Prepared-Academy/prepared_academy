import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../services/user_service.dart';
import '../../../utils/app_constants.dart';

// import 'package:webviewx_plus/webviewx_plus.dart';

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
//   final iframe = '''
// <html>
//   <iframe ...referrerpolicy="strict-origin" src="https://player.vimeo.com/video/747516331?quality=720p" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen style="position:absolute;top:0;left:0;width:100%;height:100%;" title="M2"></iframe><script src="https://player.vimeo.com/api/player.js"></script>
// </html>
// ''';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final frm = Uri.dataFromString(
    //   iframe,
    //   mimeType: 'text/html',
    // );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: InAppWebView(
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  supportZoom: false,
                )),
                initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        "${AppConstants.BASE_URL}/vimeovideo?webLink=${widget.videoUrl}"),
                    headers: {"Authorization": "Bearer ${UserService.token}"}),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
