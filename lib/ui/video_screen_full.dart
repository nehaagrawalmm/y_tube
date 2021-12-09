import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:y_tube/data/video.dart';
import 'package:y_tube/ui/video_widget.dart';

class VideoScreenFull extends StatelessWidget {
  const VideoScreenFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final video = ModalRoute.of(context)!.settings.arguments as Video;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(video.videoName),
      ),
      body: Center(
          child: Column(children: <Widget>[
        Text(video.videoDesc),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: VideoWidget(video),
        ),
      ])),
    );
  }
}
