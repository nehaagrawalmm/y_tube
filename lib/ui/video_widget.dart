import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:y_tube/data/video.dart';

class VideoWidget extends StatefulWidget {
  Video myVideo = const Video("videoName", "videoDesc", "videoUrl");

  VideoWidget(Video video, {Key? key}) : super(key: key) {
    myVideo = video;
  }

  @override
  _VideoAppState createState() => _VideoAppState(myVideo);
}

class _VideoAppState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late Video _video;

  _VideoAppState(Video myVideo) {
    _video = myVideo;
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_video.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 300,
      child: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: Center(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
