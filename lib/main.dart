import 'package:flutter/material.dart';
import 'package:y_tube/data/video.dart';
import 'package:y_tube/firebase_init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:y_tube/ui/you_tube_main.dart';

Future<void> main() async {
  late List<Video> videos;
  late List<String> category;

  Future<List<Video>> readDataFromFirestore() async {
    final db = FirebaseFirestore.instance;
    List<Video> myList = [];

    return await db.collection("videolist").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        myList.add(Video.fromMap(result.data()));
      }
      videos = myList;
      print("neha inside async");
      return myList;
    });
  }

  Future<List<String>> readVideoCategoryFromFirestore() async {
    final db = FirebaseFirestore.instance;
    List<String> myList = [];

    return await db.collection("videoCategory").get().then((querySnapshot) {
      var category1 = List.from(querySnapshot.docs[0].data().values).first;
      category = List.from(
          category1.map((item) => item as String)?.toList().cast<String>());

      Iterator it = category.iterator;
      while (it.moveNext()) {
        myList.add(it.current);
        print(it.current);
      }

      category = myList;
      return myList;
    });
  }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await readDataFromFirestore();
  await readVideoCategoryFromFirestore();

  runApp(MyApp(videos, category));
}

class MyApp extends StatelessWidget {
  late List<Video> videos;
  late List<String> category;

  MyApp(List<Video> readDataFromFirestore, this.category, {Key? key})
      : super(key: key) {
    videos = readDataFromFirestore;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passing Data',
      home: YouTubeScreen(videos: videos, category: category),
    );
  }
}
