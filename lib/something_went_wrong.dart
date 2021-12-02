
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:y_tube/snackbar_page.dart';

class SomethingWentWrong extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          alignment:Alignment.topLeft,

          child: Text('Yay! A SnackBar!'),

        ),


      ),// Complete this code in the next step.

    );

  }
}