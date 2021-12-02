// We are using a StatefulWidget such that we only create the [Future] once,
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:y_tube/something_went_wrong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'my_three_options.dart';


/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class FireApp extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<FireApp> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {

          return const MaterialApp(
            home: MyThreeOptions());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
            home : Loading());
      },
    );
  }
}

class Loading  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          alignment:Alignment.topLeft,

          child: const Text('Yay! A SnackBar!'),

        ),


      ),// Complete this code in the next step.

    );
  }
}

