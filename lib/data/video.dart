class Video {
  final String videoUrl;
  final String videoDesc;
  final String videoName;

  const Video(this.videoName, this.videoDesc,this.videoUrl);


  Map<String, dynamic> toMap() =>
      {
        "videoUrl": videoUrl,
        "videoName": videoName,
        "videoDesc":videoDesc
      };

  Video.fromMap(Map<String, dynamic> map)
      : videoName = map["videoName"].toString(),
        videoUrl = map["videoUrl"].toString(),
  videoDesc = map["videoDesc"].toString();
}


