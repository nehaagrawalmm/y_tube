import 'package:flutter/material.dart';
import 'package:y_tube/data/video.dart';
import 'package:y_tube/ui/video_screen_full.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:y_tube/ui/video_widget.dart';

class YouTubeScreen extends StatelessWidget {
  YouTubeScreen({Key? key, required this.videos}) : super(key: key);

  final List<Video> videos;
  final int? _value = 1;
  final int? _size = 10;

  final db = FirebaseFirestore.instance;


  @override
  Widget build(BuildContext context) {
    print("neha outside async");

    return Scaffold(
        appBar: AppBar(
        title: const Text('Todos'),
    ),
    body:SizedBox(
    //MediaQuery methods in use
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.8,

    child: Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.8,
    alignment:Alignment.topLeft,


      child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
    children: <Widget>[
    SingleChildScrollView(

    scrollDirection: Axis.horizontal,
    child: Row(
    children: List<Widget>.generate(
    _size!,
    (int index) {
    return ChoiceChip(
    label: Text('Item $index'),
    selected: _value == index,
    onSelected: (bool selected) {
    },
    );
    },
    ).toList(),
    ),
    ),
    ListView.builder(
    itemCount: videos.length,
    shrinkWrap: true, // use this
    itemBuilder: (context, index) {
    //   print(videos[index].videoName);
    // print(videos[index].videoUrl);
    // print(videos[index].videoDesc);


    return Card(
    child:InkWell(
    splashColor: Colors.blue,
    /* onTap: () {
                                          print('Card tapped.');
                                        },*/
    child: SizedBox(
    width: 300,
    height: 200,
    child: Column(
    children: <Widget>[
    ListTile(
    title: Text(videos[index].videoName),
    // When a user taps the ListTile, navigate to the DetailScreen.
    // Notice that you're not only creating a DetailScreen, you're
    // also passing the current todo through to it.
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VideoScreenFull(),
          // Pass the arguments as part of the RouteSettings. The
          // DetailScreen reads the arguments from these settings.
          settings: RouteSettings(
            arguments: videos[index],
          ),
        ),
      );
    }
    ),
     VideoWidget(
        videos[index]
    ),
    /*  const VideoWidget(

      ),
*/
    ],
    ),
    ),
    ),
    );



    },
    )
    ]


    ),
    ),
    ),
    ),
    );
    }
  }