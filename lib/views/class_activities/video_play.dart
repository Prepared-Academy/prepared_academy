import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:prepared_academy/routes/router.dart';
import 'package:prepared_academy/themes/color_theme.dart';
import 'package:prepared_academy/widgets/buttons.dart';
import 'package:prepared_academy/widgets/loading.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPlay extends StatefulWidget {
  final String videoUrl;
  final bool isChapterVideo;
  final int? objectiveId;
  const VideoPlay({
    Key? key,
    required this.videoUrl,
    required this.isChapterVideo,
    this.objectiveId,
  }) : super(key: key);

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  bool isShowQuizButton = false;
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
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

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visibility) {
        if (visibility.visibleFraction == 0 && mounted) {
          flickManager.flickControlManager?.autoPause();
        } else if (visibility.visibleFraction == 1) {
          flickManager.flickControlManager?.autoResume();
        }
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
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
            const SizedBox(height: 10),
            Flexible(
              child: Visibility(
                visible: isShowQuizButton,
                child: CustomButton(
                    onPressed: () {
                      OneContext().popDialog();
                      OneContext().pushNamed(AppRoutes.QUIZACTIVITY,
                          arguments: {"objectiveId": widget.objectiveId});
                    },
                    text: "Take Quiz"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
