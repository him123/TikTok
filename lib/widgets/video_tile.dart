import 'package:flutter/material.dart';
import 'package:tiktok/utils/colors.dart';
import 'package:video_player/video_player.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({super.key});

  @override
  State<VideoTile> createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  late VideoPlayerController videoPlayerController;
  late Future initializeVideoPlayer;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    initializeVideoPlayer = videoPlayerController.initialize()
      ..then((value) {
        videoPlayerController.play();
      });
    videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: initializeVideoPlayer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return InkWell(
                onTap: () {
                  videoPlayerController.value.isPlaying
                      ? videoPlayerController.pause()
                      : videoPlayerController.play();
                  setState(() {});
                },
                child: Stack(children: [
                  VideoPlayer(videoPlayerController),
                  Center(
                    child: Icon(
                      Icons.play_arrow_rounded,
                      color: ColorUtils.white.withOpacity(
                          videoPlayerController.value.isPlaying ? 0 : 0.5),
                      size: 60,
                    ),
                  )
                ]));
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorUtils.grey,
              ),
            );
          }
        },
      ),
    );
  }
}
