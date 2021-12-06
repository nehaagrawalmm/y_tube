import 'package:flutter/material.dart';
import 'package:y_tube/data/video.dart';
import 'package:y_tube/firebase_init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:y_tube/ui/you_tube_main.dart';

Future<void> main() async {

  late List<Video> videos;

  Future<List<Video>> readDataFromFirestore()  async {
    final db = FirebaseFirestore.instance;
    List<Video> myList = [];

    return await db.collection("videolist").get().then((querySnapshot) {
      for (var result in querySnapshot.docs) {
        myList.add(Video.fromMap(result.data()));

      }
      videos=myList;
      print("neha inside async");
      return myList;
    });

  }

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await readDataFromFirestore();

  runApp(
     MyApp(videos)
  );



}



class MyApp extends StatelessWidget {
  late List<Video> videos;

  MyApp(List<Video> readDataFromFirestore, {Key? key}) : super(key: key){
      videos=readDataFromFirestore;
   }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Passing Data',
        home: YouTubeScreen(videos:videos),
    );
  }



}


