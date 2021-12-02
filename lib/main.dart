import 'package:flutter/material.dart';
import 'package:y_tube/firebase_init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

 // runApp(FireApp());
  runApp( FireApp());
}

/*lass MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( //use MaterialApp() widget like this
        home:  FireApp() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}*/



