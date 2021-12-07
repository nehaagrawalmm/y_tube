import 'package:flutter/material.dart';
import 'package:y_tube/data/video.dart';
import 'package:y_tube/ui/video_screen_full.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:y_tube/ui/video_widget.dart';

class YouTubeScreen extends StatelessWidget {
  YouTubeScreen({Key? key, required this.videos, required this.category})
      : super(key: key);

  final List<Video> videos;
  final List<String> category;
  final int? _value = 1;
  final int? _size = 10;

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Y Tube'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /* Text(
          'Headline',
          style: TextStyle(fontSize: 18),
        ),*/

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                category.length,
                (int index) {
                  return ChoiceChip(
                    label: Text(category[index]),
                    selected: _value == index,
                    onSelected: (bool selected) {},
                  );
                },
              ).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              shrinkWrap: true, // use this
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    splashColor: Colors.blue,
                    child: SizedBox(
                      width: 500,
                      height: 400,
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
                                    builder: (context) =>
                                        const VideoScreenFull(),
                                    // Pass the arguments as part of the RouteSettings. The
                                    // DetailScreen reads the arguments from these settings.
                                    settings: RouteSettings(
                                      arguments: videos[index],
                                    ),
                                  ),
                                );
                              }),
                          VideoWidget(videos[index]),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/*  const VideoWidget(

      ),
*/

/*     ],
                    ),
                  ),
                ),
              );
            },
          )
          ),
        ],
      ),*/

/*  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List<Widget>.generate(
                _size!,
                (int index) {
                  return ChoiceChip(
                    label: Text('Item $index'),
                    selected: _value == index,
                    onSelected: (bool selected) {},
                  );
                },
              ).toList(),
            ),
          ),

      ),
    );
  }
}*/
