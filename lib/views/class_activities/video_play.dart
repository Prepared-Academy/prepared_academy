import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/providers/class_activity_provider.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../setup.dart';
import '../../utils/shared_preference.dart';

class VideoPlay extends StatefulWidget {
  final String videoUrl;
  final bool isChapterVideo;
  final int? objectiveId;
  final int? objectiveVideoId;
  final String? moduele;
  final String? description;
  const VideoPlay({
    Key? key,
    required this.videoUrl,
    required this.isChapterVideo,
    this.objectiveId,
    this.objectiveVideoId,
    this.moduele,
    this.description,
  }) : super(key: key);

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  final locator = getIt.get<SharedPreferencesHelper>();

  bool isShowQuizButton = false;
  late FlickManager flickManager;
  String token = "";
  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
      autoPlay: false,
      videoPlayerController: VideoPlayerController.network(widget.videoUrl),
    );

    if (widget.isChapterVideo == true) {
      flickManager.flickVideoManager!.videoPlayerController!
          .addListener(checkVideo);
    }
  }

  void checkVideo() {
    if (mounted) {
      setState(() => isShowQuizButton = false);
      if (flickManager.flickVideoManager!.videoPlayerValue!.position ==
          const Duration(seconds: 0, minutes: 0, hours: 0)) {}

      if (flickManager.flickVideoManager!.videoPlayerValue!.position ==
          flickManager.flickVideoManager!.videoPlayerValue!.duration) {
        flickManager.flickControlManager!.exitFullscreen();
        setState(() => isShowQuizButton = true);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
  }

  final iframe = '''
<html>
  <iframe ...referrerpolicy="strict-origin" src="https://player.vimeo.com/video/747516331?quality=720p" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen style="position:absolute;top:0;left:0;width:100%;height:100%;" title="M2"></iframe><script src="https://player.vimeo.com/api/player.js"></script>
</html>
''';

  @override
  Widget build(BuildContext context) {
    // final frm = Uri.dataFromString(
    //   iframe,
    //   mimeType: 'text/html',
    // );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: VisibilityDetector(
          key: ObjectKey(flickManager),
          onVisibilityChanged: (visibility) {
            if (visibility.visibleFraction == 0 && mounted) {
              flickManager.flickControlManager?.autoPause();
            } else if (visibility.visibleFraction == 1) {
              flickManager.flickControlManager?.autoResume();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Card(
                  child: AspectRatio(
                    aspectRatio: 1.6,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: FlickVideoPlayer(
                        flickManager: flickManager,
                        flickVideoWithControlsFullscreen:
                            const FlickVideoWithControls(
                          controls: FlickLandscapeControls(),
                        ),
                        flickVideoWithControls: FlickVideoWithControls(
                          playerLoadingFallback: const Loading(),
                          aspectRatioWhenLoading: 1.6,
                          controls: FlickPortraitControls(
                            progressBarSettings: FlickProgressBarSettings(
                                playedColor: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.moduele ?? "",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.description ?? "",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isShowQuizButton,
                      child: CustomButton(
                          onPressed: () {
                            context.read<ClassActivityProvider>().objectiveId =
                                widget.objectiveId!;
                            context
                                .read<ClassActivityProvider>()
                                .objectiveVideoId = widget.objectiveVideoId!;
                            OneContext().pushNamed(AppRoutes.QUIZACTIVITY);
                          },
                          text: "Take Quiz"),
                    )
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
