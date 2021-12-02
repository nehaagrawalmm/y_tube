import 'package:flutter/material.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp( //use MaterialApp() widget like this
        home: MyThreeOptions() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}



class MyThreeOptions extends StatefulWidget {
  const MyThreeOptions({Key? key}) : super(key: key);

 // const MyThreeOptions( {Key? key}) : super(key: key)


  @override
  State<MyThreeOptions> createState() => _MyThreeOptionsState();


}

class _MyThreeOptionsState extends State<MyThreeOptions> {
  int? _value = 1;
  int? _size=10;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Y Tube"),
        ),
        body: Container(
          //MediaQuery methods in use
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,

          child:  Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.1,
         alignment:Alignment.topLeft,
         child: SingleChildScrollView(

              scrollDirection: Axis.horizontal,
            child: Row(
            children: List<Widget>.generate(
              _size!,
                  (int index) {
                return ChoiceChip(
                  label: Text('Item $index'),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                );
              },
            ).toList(),
          ),
        ),
        ),
        ),
    );
  }
}
